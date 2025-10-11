import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:appelsin/models/Kyc.dart';

import 'package:shared_preferences/shared_preferences.dart';
class Appelsinkycapi {

  final String url = 'https://app.appelsin.dk';


  Future<http.Response> createKyc(Kyc k, int userid) async {
    final shared = await SharedPreferences.getInstance();
    final String jwt = shared.getString('jwt') ?? '';
print(jsonEncode(k));
    // Debug: Check if JWT exists
    if (jwt.isEmpty) {
      throw Exception("JWT token is missing. Please login first.");
    }
    final uri = Uri.parse('${url}/api/Kyc/${userid}');
    final response  = await http.post(uri, body: jsonEncode(k), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $jwt',
    });
    if(response.statusCode == 200) {
      return response;
    } else {
      throw Exception("${response.statusCode}");
    }
  }

  Future<http.Response> update(Kyc k) async {
    final shared = await SharedPreferences.getInstance();
    final String jwt = shared.getString('jwt') ?? '';

    // Debug: Check if JWT exists
    if (jwt.isEmpty) {
      throw Exception("JWT token is missing. Please login first.");
    }
    final uri = Uri.parse('${url}/api/Kyc');
    final response  = await http.put(uri, body: jsonEncode(k));
    if(response.statusCode == 200) {
      return response;
    } else {
      throw Exception("");
    }
  }

  Future<http.Response> delete(Kyc k) async {
    final shared = await SharedPreferences.getInstance();
    final String jwt = shared.getString('jwt') ?? '';

    // Debug: Check if JWT exists
    if (jwt.isEmpty) {
      throw Exception("JWT token is missing. Please login first.");
    }
    final uri = Uri.parse('${url}/api/Kyc');
    final response  = await http.delete(uri, body: jsonEncode(k));
    if(response.statusCode == 200) {
      return response;
    } else {
      throw Exception("");
    }
  }

}