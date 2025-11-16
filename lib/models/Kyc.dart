import 'package:appelsin/models/AppelsinBruger.dart';

class Kyc {

  
  int? appelsinBrugerId;
   String linje;
  bool? isDone;
  double? ammount;
 String step;

  Kyc({
    required this.appelsinBrugerId,
    required this.linje,
    required this.isDone,
    required this.step
});

  factory Kyc.fromJson(Map<String, dynamic> map) {
    return Kyc(appelsinBrugerId: map['appelsinBrugerId'], linje: map['linje'], isDone: map['isDone'], step:  map['step']);
  }


  Map<String, dynamic> toJson(){
    return {
      'appelsinBrugerId': appelsinBrugerId,
      'linje':linje,
      'isDone':isDone,
      'step': step
    };
  }

}
