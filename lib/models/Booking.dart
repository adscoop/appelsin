import 'package:flutter/foundation.dart';

class Booking {
  final  String email;

 final String phone;

final int appelsin_userid;
  
const Booking({
    required this.email,
  required this.phone,
  required this.appelsin_userid
});

factory Booking.fromJson(Map<String,dynamic> map) {
  return Booking(email:  map['email'], phone: map['phone'], appelsin_userid: map['appelsin_userid']);
  }

  Map<String, dynamic> toJson(){
    return {
      'email': email,
      'phone':phone,
      'appelsin_userid':appelsin_userid
    };
  }
  
}