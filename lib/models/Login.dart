import 'package:flutter/cupertino.dart';

class Login {
  
  final String api_key;
  
  Login({ required this.api_key});
  
factory Login.fromJson(Map<String, dynamic> map) {
  return Login(api_key: map['api_key']);
}

toJson() {
  return {
    'api_key':api_key
  };
}
}