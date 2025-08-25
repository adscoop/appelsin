class Appelsinbruger {
   int? Id;
final String FirstName;
final String LastName;
final String PhoneNumber;
final String Email ;


Appelsinbruger({
     required this.FirstName,
  required this.LastName,
  required this.PhoneNumber,
  required this.Email
});

factory Appelsinbruger.fromJson(Map<String, dynamic> map) {
  return Appelsinbruger(FirstName: map['FirstName'], LastName: map['LastName'], PhoneNumber: map['PhoneNumber'], Email: map['Email'],);
}

Map<String , dynamic> toJson(){
  return {
    'FirstName': this.FirstName,
    'LastName': this.LastName,
    'PhoneNumber': this.PhoneNumber,
    'Email': this.Email
  };
}

}