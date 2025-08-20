import 'package:appelsin/models/AppelsinBruger.dart';

class Kyc {

  Appelsinbruger appelsin_bruger;
  String linje;
  bool isDone;

  Kyc({
    required this.appelsin_bruger,
    required this.linje,
    required this.isDone
});

  factory Kyc.fromJson(Map<String, dynamic> map) {
    return Kyc(appelsin_bruger: Appelsinbruger.fromJson(map['appelsin_bruger']), linje: map['linje'], isDone: map['isDone']);
  }


  Map<String, dynamic> toJson(){
    return {
      'appelsin_bruger': appelsin_bruger.toJson(),
      'linje':linje,
      'isDone':isDone
    };
  }

}
