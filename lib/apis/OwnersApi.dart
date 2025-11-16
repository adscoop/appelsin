import 'package:appelsin/models/Owners.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Ownersapi {

  static String url = 'https://app.appelsin.dk';


  Future<http.Response> create(Owners owner) async {
    print(jsonEncode(owner));
    final uri = Uri.parse('${url}/api/Owners');

    final shared = await SharedPreferences.getInstance();
    final String jwt = shared.getString('jwt') ?? '';
    print(jsonEncode(owner));
    // Debug: Check if JWT exists
    if (jwt.isEmpty) {
      throw Exception("JWT token is missing. Please login first.");
    }

    final response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $jwt',
        },
        body: jsonEncode(owner.toJson())
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("failed to add owner");
    }

  }

}