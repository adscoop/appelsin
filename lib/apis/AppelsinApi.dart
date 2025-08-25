import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class Appelsinapi {

static String url = 'http://localhost:5144';
  Future<http.Response> sendSms(String phone) async {
    final uri = Uri.parse('${url}/api/Sms/send/${phone}');


   final response = await http.get(uri);

   if(response.statusCode == 200) {
     return response;
   } else {
     throw Exception("Failed to send sms ${response.statusCode}");
   }



  }

  Future<http.Response> opretAppelsinBruger(Appelsinbruger appelsin) async {
    final uri = Uri.parse('${url}/api/AppelsinUser/opret');

    final response = await http.post(uri, body:convert.jsonEncode(appelsin));
    if(response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Cannot create appelsinbruge ${response.statusCode}");
    }
  }

}