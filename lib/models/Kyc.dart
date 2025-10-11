import 'package:appelsin/models/AppelsinBruger.dart';

class Kyc {

  
  int? appelsinBrugerId;
   String linje;
  bool? isDone;
  double? ammount;
 

  Kyc({
    required this.appelsinBrugerId,
    required this.linje,
    required this.isDone
});

  factory Kyc.fromJson(Map<String, dynamic> map) {
    return Kyc(appelsinBrugerId: map['appelsinBrugerId'], linje: map['linje'], isDone: map['isDone']);
  }


  Map<String, dynamic> toJson(){
    return {
      'appelsinBrugerId': appelsinBrugerId,
      'linje':linje,
      'isDone':isDone
    };
  }

}
