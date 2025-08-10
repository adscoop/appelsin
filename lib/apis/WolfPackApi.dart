
import 'package:http/http.dart' as http ;
import 'dart:convert';
import 'package:appelsin/models/VoucherDTO.dart';
class Wolfpackapi {


  Future<http.Response> sendVoucher(VoucherDTO v) async {
    final uri  = Uri.parse('');
    final response = await http.post(uri, headers:  {},body: jsonEncode(v) );
    if(response.statusCode == 204) {
      return response;
    } else {
      throw Exception("");
    }
  }



}