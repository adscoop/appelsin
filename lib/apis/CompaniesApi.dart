import 'package:appelsin/models/Companies.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class CompaniesApi {
  static String url = 'https://app.appelsin.dk';

  Future<http.Response> createCompany(Companies c) async {
    final uri = Uri.parse('${url}/api/Companies/'
    );
    final shared = await SharedPreferences.getInstance();
    final String jwt = shared.getString('jwt') ?? '';
    print(jsonEncode(c));
    // Debug: Check if JWT exists
    if (jwt.isEmpty) {
      throw Exception("JWT token is missing. Please login first.");
    }

    final response = await http.post(uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
      },
        body: jsonEncode(c)
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("failed to create company ");
    }

  }

  Future<Companies> getCompanyByUserId(int userid) async {
    print(userid);
    final uri = Uri.parse('${url}/api/Companies/get/${userid}'
    );

    final shared = await SharedPreferences.getInstance();
    final String jwt = shared.getString('jwt') ?? '';

    // Debug: Check if JWT exists
    if (jwt.isEmpty) {
      throw Exception("JWT token is missing. Please login first.");
    }

    final response = await http.get(uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $jwt',
        },

    );

    if (response.statusCode == 200) {
      return Companies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Get User by Id");
    }

  }




}