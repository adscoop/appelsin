import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:appelsin/models/Kyc.dart';
class Appelsinkycapi {



  Future<http.Response> createKyc(Kyc k) async {
    final uri = Uri.parse('');
    final response  = await http.post(uri, body: jsonEncode(k));
    if(response.statusCode == 200) {
      return response;
    } else {
      throw Exception("");
    }
  }

  Future<http.Response> update(Kyc k) async {
    final uri = Uri.parse('');
    final response  = await http.put(uri, body: jsonEncode(k));
    if(response.statusCode == 200) {
      return response;
    } else {
      throw Exception("");
    }
  }

  Future<http.Response> delete(Kyc k) async {
    final uri = Uri.parse('');
    final response  = await http.delete(uri, body: jsonEncode(k));
    if(response.statusCode == 200) {
      return response;
    } else {
      throw Exception("");
    }
  }

}