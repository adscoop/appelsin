import 'package:appelsin/models/Booking.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Bookingapi {
  
  static String url = 'https://app.appelsin.dk';
  Future<http.Response> create(Booking booking)  async{
    final uri = Uri.parse('${url}/api/Booking');
    final shared = await SharedPreferences.getInstance();
    final String jwt = shared.getString('jwt') ?? '';

    if (jwt.isEmpty) {
      throw Exception("JWT token is missing. Please login first.");
    }
    final response  = await http.post(uri, body: jsonEncode(booking), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $jwt',
    });
   if (response.statusCode == 200) {
     return response;
   } else {
     throw Exception("Cannot create booking ${response.statusCode}");
   }
  }

}