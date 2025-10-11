import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:appelsin/models/Login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';
class Appelsinapi {
  // Make sure there's NO whitespace before or after the URL
  final String url = 'https://app.appelsin.dk';


  Future<http.Response> opretAppelsinBruger(Appelsinbruger appelsin) async {
    final shared = await SharedPreferences.getInstance();
    final String jwt = shared.getString('jwt') ?? '';
    
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
    
    if(response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      throw Exception("Authentication failed. JWT token may be invalid or expired.");
    } else {
      throw Exception("Cannot create appelsinbruger: ${response.statusCode} - ${response.body}");
    }
  }
  Future<http.Response> getJwt() async {
    final uri = Uri.parse('${url}/api/Login/auth');
    Login login = Login(api_key: 'mOD64iSIRP9nHeTezynBuaIkUI3dWKUvN');
    final convertetLogin =  convert.jsonEncode(login);
    print(convertetLogin);
    final response = await http.post(uri, body: convertetLogin, headers: {
      'Content-Type': 'application/json',  // Add this header
    });
    if(response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Cannot get jwt token");
    }
    
  }
  
Future<http.Response> sendSms(String telefon) async {
    final uri = Uri.parse('${url}/api/Sms/send/${telefon}');
    final shared = await SharedPreferences.getInstance();
    final String jwt = shared.getString('jwt') ?? '';

    // Debug: Check if JWT exists
    if (jwt.isEmpty) {
      throw Exception("JWT token is missing. Please login first.");
    }

    print('Using JWT: $jwt'); // Debug log



    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
      },

    );
    if(response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      throw Exception("Authentication failed. JWT token may be invalid or expired.");
    } else {
      throw Exception("Cannot create appelsinbruger: ${response.statusCode} - ${response.body}");
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
    
    if(response.statusCode == 200) {
      return Appelsinbruger.fromJson(convert.jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw Exception("Authentication failed. JWT token may be invalid or expired.");
    } else {
      throw Exception("Cannot get Appelsinbruger by e-mail ${response.statusCode} - ${response.body}");
    }
}
 
  
}