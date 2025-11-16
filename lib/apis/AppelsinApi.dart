import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:appelsin/models/CvrSearchResult.dart';
import 'package:appelsin/models/CvrLocalSearch.dart';
import 'package:appelsin/models/Login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

// Helper: lowercase first character (used in key normalization)
String _lcFirst(String s) => s.isEmpty ? s : s[0].toLowerCase() + s.substring(1);

class Appelsinapi {
  // Make sure there's NO whitespace before or after the URL
  final String url = 'https://app.appelsin.dk';

  // Parse a single NDJSON line and append into the aggregate lists.
  // Silently ignores malformed lines.
  void _consumeNdjsonLine(String line,
      List<Map<String, dynamic>> navnData,
      List<Map<String, dynamic>> enhedData,) {
    try {
      final dynamic obj = convert.jsonDecode(line);
      if (obj is! Map) return;
      final map = (obj as Map).cast<String, dynamic>();
      final type = map['type']?.toString().toLowerCase();
      final data = map['data'];
      if (data is! Map) return;
      final normalized = <String, dynamic>{};
      // Copy and normalize keys to camel/lower variants expected by models
      (data as Map).forEach((k, v) {
        final key = k.toString();
        normalized[key] = v;
        normalized[_lcFirst(key)] = v;
        final kl = key.toLowerCase();
        // Specific remaps used by our models
        if (kl == 'cvrenhedsid') normalized['cvrEnhedsId'] = v.toString();
        if (kl == 'forretningsnoegle')
          normalized['forretningsnoegle'] = v.toString();
        if (kl == 'datafordeleropdateringstid')
          normalized['datafordelerOpdateringstid'] = v.toString();
        if (kl == 'enhedstype') normalized['enhedsType'] = v.toString();
      });
      if (type == 'navn') {
        navnData.add(normalized);
      } else if (type == 'enhed' || type == 'enheder') {
        enhedData.add(normalized);
      }
    } catch (_) {
      // Ignore malformed line
    }
  }

  /// Streaming CVR search that parses NDJSON incrementally and emits partial results.
  /// Falls back to emit once at end if the response is standard JSON (array/object).
  Stream<List<CvrSearchResult>> searchStream(String companyname) async* {
    // Ensure we have a JWT (refresh each call like getSearch does)
    final jwtResponse = await getJwt();
    final jwtData = convert.jsonDecode(jwtResponse.body);
    final String newJwt = jwtData['token'] ?? jwtData['jwt'] ?? '';

    final shared = await SharedPreferences.getInstance();
    await shared.setString('jwt', newJwt);
    final String jwt = shared.getString('jwt') ?? '';
    if (jwt.isEmpty) {
      throw Exception("JWT token is missing. Please login first.");
    }

    final encodedName = Uri.encodeComponent(companyname);
    final uri = Uri.parse('${url}/api/CVR/cvr/combined/$encodedName');

    final request = http.Request('GET', uri);
    request.headers.addAll({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $jwt',
    });

    final client = http.Client();
    try {
      final streamed = await client.send(request);
      if (streamed.statusCode == 401) {
        throw Exception(
            "Authentication failed. JWT token may be invalid or expired.");
      }
      if (streamed.statusCode != 200) {
        final bodyBytes = await streamed.stream.toBytes();
        final bodyText = String.fromCharCodes(bodyBytes);
        throw Exception(
            "Cannot search for company: ${streamed.statusCode} - ${bodyText}");
      }

      // We'll attempt NDJSON incremental parsing; also keep a buffer in case it's a single JSON document.
      final navnData = <Map<String, dynamic>>[];
      final enhedData = <Map<String, dynamic>>[];

      final buffer = StringBuffer();

      await for (final chunk in streamed.stream.transform(
          convert.utf8.decoder)) {
        buffer.write(chunk);
        // Process any complete lines for NDJSON
        final text = buffer.toString();
        final lines = text.split(RegExp(r'\r?\n'));
        // Keep the last partial line in the buffer
        buffer.clear();
        if (lines.isNotEmpty) {
          // Re-append the last line if we can't confirm it ends with a newline in this chunk
          final hadTrailingNewline = text.endsWith('\n') || text.endsWith('\r');
          final upto = hadTrailingNewline ? lines.length : lines.length - 1;
          for (var i = 0; i < upto; i++) {
            final line = lines[i].trim();
            if (line.isEmpty) continue;
            _consumeNdjsonLine(line, navnData, enhedData);
            // Emit partial combined result after each valid line
            yield [
              CvrSearchResult(
                queryName: companyname,
                timestampUsed: DateTime.now(),
                navn: navnData.map((m) => NavnItem.fromJson(m)).toList(),
                enheder: enhedData.map((m) => Enhed.fromJson(m)).toList(),
              )
            ];
          }
          // Save remaining partial (or last) line back to buffer if needed
          if (!hadTrailingNewline && lines.isNotEmpty) {
            buffer.write(lines.last);
          }
        }
      }

      // Stream completed. If we never emitted anything (no NDJSON lines), try parsing the whole buffer as JSON once.
      if (navnData.isEmpty && enhedData.isEmpty) {
        final full = buffer.toString().trim();
        if (full.isNotEmpty) {
          try {
            final dynamic decoded = convert.jsonDecode(full);
            List<CvrSearchResult> results;
            if (decoded is List) {
              results = decoded
                  .whereType<Map>()
                  .map((e) =>
                  CvrSearchResult.fromJson((e as Map).cast<String, dynamic>()))
                  .toList();
            } else if (decoded is Map<String, dynamic>) {
              results = [CvrSearchResult.fromJson(decoded)];
            } else {
              results = const <CvrSearchResult>[];
            }
            yield results;
            return;
          } catch (_) {
            // Fall through: we couldn't parse JSON; emit nothing.
          }
        }
      } else {
        // Emit final aggregate to ensure UI has the last snapshot
        yield [
          CvrSearchResult(
            queryName: companyname,
            timestampUsed: DateTime.now(),
            navn: navnData.map((m) => NavnItem.fromJson(m)).toList(),
            enheder: enhedData.map((m) => Enhed.fromJson(m)).toList(),
          )
        ];
      }
    } finally {
      client.close();
    }
  }


  Future<http.Response> opretAppelsinBruger(Appelsinbruger appelsin) async {
    final shared = await SharedPreferences.getInstance();
    final String jwt = shared.getString('jwt') ?? '';
print(convert.jsonEncode(appelsin));
    // Debug: Check if JWT exists
    if (jwt.isEmpty) {
      throw Exception("JWT token is missing. Please login first.");
    }

    print('Using JWT: $jwt'); // Debug log

    final uri = Uri.parse('${url}/api/AppelsinUser/opret');

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
      },
      body: convert.jsonEncode(appelsin.toJson()),
    );

    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      throw Exception(
          "Authentication failed. JWT token may be invalid or expired.");
    } else {
      throw Exception(
          "Cannot create appelsinbruger: ${response.statusCode} - ${response
              .body}");
    }
  }

  Future<http.Response> updateAppelsinBruger(Appelsinbruger appelsin) async {
    final shared = await SharedPreferences.getInstance();
    final String jwt = shared.getString('jwt') ?? '';
print(convert.jsonEncode(appelsin));
    // Debug: Check if JWT exists
    if (jwt.isEmpty) {
      throw Exception("JWT token is missing. Please login first.");
    }

    print('Using JWT: $jwt'); // Debug log

    final uri = Uri.parse('${url}/api/AppelsinUser/opdater');

    final response = await http.put(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
      },
      body: convert.jsonEncode(appelsin),
    );

    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      throw Exception(
          "Authentication failed. JWT token may be invalid or expired.");
    } else {
      throw Exception(
          "Cannot create appelsinbruger: ${response.statusCode} - ${response
              .body}");
    }
  }

  Future<http.Response> getJwt() async {
    final uri = Uri.parse('${url}/api/Login/auth');
    Login login = Login(api_key: 'mOD64iSIRP9nHeTezynBuaIkUI3dWKUvN');
    final convertetLogin = convert.jsonEncode(login);
    print(convertetLogin);
    final response = await http.post(uri, body: convertetLogin, headers: {
      'Content-Type': 'application/json', // Add this header
    });
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Cannot get jwt token");
    }
  }

  Future<http.Response> sendSms(String telefon, String name) async {
    print('${telefon} ${name}')   ;
    final uri = Uri.parse('${url}/api/Sms/Gatway/${telefon}/${name}');
    final shared = await SharedPreferences.getInstance();
    final String jwt = shared.getString('jwt') ?? '';

    // Debug: Check if JWT exists
    if (jwt.isEmpty) {
      throw Exception("JWT token is missing. Please login first.");
    }

    print('Using JWT: $jwt'); // Debug log


    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
      },

    );
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      throw Exception(
          "Authentication failed. JWT token may be invalid or expired.");
    } else {
      throw Exception(
          "Failed to send sms: ${response.statusCode} - ${response
              .body}");
    }
  }

  Future<Appelsinbruger> getBrugerByEmail(String email) async {
    // Wait for JWT to be fetched and store it
    final jwtResponse = await getJwt();
    final jwtData = convert.jsonDecode(jwtResponse.body);
    final String newJwt = jwtData['token'] ?? jwtData['jwt'] ?? '';

    // Store the new JWT
    final shared = await SharedPreferences.getInstance();
    await shared.setString('jwt', newJwt);

    final String jwt = shared.getString('jwt') ?? '';

    // Debug: Check if JWT exists
    if (jwt.isEmpty) {
      throw Exception("JWT token is missing. Please login first.");
    }

    final uri = Uri.parse('${url}/api/AppelsinUser/getbyemail/${email}');

    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
      },
    );

    if (response.statusCode == 200) {
      return Appelsinbruger.fromJson(convert.jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw Exception(
          "Authentication failed. JWT token may be invalid or expired.");
    } else {
      throw Exception("Cannot get Appelsinbruger by e-mail ${response
          .statusCode} - ${response.body}");
    }
  }



  /// Fetch local CVR search results using the new /api/cvr/local-search endpoint.
  /// Returns pagination metadata and items as CvrLocalSearchResult.
  Future<CvrLocalSearchResult> getLocalSearch(String query, {
    int page = 1,
    int pageSize = 5,
  }) async {
    // Refresh JWT (same pattern as other API calls)
    final jwtResponse = await getJwt();
    final jwtData = convert.jsonDecode(jwtResponse.body);
    final String newJwt = jwtData['token'] ?? jwtData['jwt'] ?? '';

    final shared = await SharedPreferences.getInstance();
    await shared.setString('jwt', newJwt);
    final String jwt = shared.getString('jwt') ?? '';

    if (jwt.isEmpty) {
      throw Exception("JWT token is missing. Please login first.");
    }

    final encodedQ = Uri.encodeQueryComponent(query);
    final uri = Uri.parse(
        '${url}/api/cvr/local-search/merged?q=$encodedQ&page=$page&pageSize=$pageSize');

    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
      },
    );

    if (response.statusCode == 200) {
      final dynamic decoded = convert.jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) {
        return CvrLocalSearchResult.fromJson(decoded);
      } else {
        throw Exception(
            'Unexpected response for local-search (expected object): ${response
                .body.substring(
                0, response.body.length > 200 ? 200 : response.body.length)}');
      }
    } else if (response.statusCode == 401) {
      throw Exception(
          "Authentication failed. JWT token may be invalid or expired.");
    } else {
      throw Exception(
          "Cannot fetch local-search: ${response.statusCode} - ${response
              .body}");
    }
  }


  Future<CvrLocalSearchResult> getLocalSearchByKey(String query, {
    int page = 1,
    int pageSize = 5,
  }) async {
    // Refresh JWT (same pattern as other API calls)
    final jwtResponse = await getJwt();
    final jwtData = convert.jsonDecode(jwtResponse.body);
    final String newJwt = jwtData['token'] ?? jwtData['jwt'] ?? '';

    final shared = await SharedPreferences.getInstance();
    await shared.setString('jwt', newJwt);
    final String jwt = shared.getString('jwt') ?? '';

    if (jwt.isEmpty) {
      throw Exception("JWT token is missing. Please login first.");
    }

    final encodedQ = Uri.encodeQueryComponent(query);
    final uri = Uri.parse(
        '${url}/api/cvr/local-search/merged/by-key?prefix=$encodedQ&page=$page&pageSize=$pageSize');

    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
      },
    );

    if (response.statusCode == 200) {
      final dynamic decoded = convert.jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) {
        return CvrLocalSearchResult.fromJson(decoded);
      } else {
        throw Exception(
            'Unexpected response for local-search (expected object): ${response
                .body.substring(
                0, response.body.length > 200 ? 200 : response.body.length)}');
      }
    } else if (response.statusCode == 401) {
      throw Exception(
          "Authentication failed. JWT token may be invalid or expired.");
    } else {
      throw Exception(
          "Cannot fetch local-search: ${response.statusCode} - ${response
              .body}");
    }
  }
  Future<http.Response> verify(String phone, String code) async {
    // Ensure phone and code are URL-safe
    final encodedPhone = Uri.encodeComponent(phone);
    final encodedCode = Uri.encodeComponent(code);
    final uri = Uri.parse('$url/api/sms/verify/$encodedPhone/$encodedCode');

    // Refresh/obtain JWT using existing flow
    final jwtResponse = await getJwt();
    final jwtData = convert.jsonDecode(jwtResponse.body);
    final String newJwt = jwtData['token'] ?? jwtData['jwt'] ?? '';

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $newJwt',
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized: invalid or expired token');
    } else if (response.statusCode == 400) {
      throw Exception('Invalid verification code or phone number');
    } else {
      throw Exception('Verification failed: ${response.statusCode} - ${response.body}');
    }
  }

}                                                     // Store the new JWT