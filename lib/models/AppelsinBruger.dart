class Appelsinbruger {
   int? Id;
final String FirstName;
final String LastName;
final String PhoneNumber;
final String Email ;
final String Password;
final String CVR;

Appelsinbruger({
     required this.FirstName,
  required this.LastName,
  required this.PhoneNumber,
  required this.Email,
  required this.Password,
  required this.CVR
});

factory Appelsinbruger.fromJson(Map<String, dynamic> map) {
  return Appelsinbruger(FirstName: map['FirstName'], LastName: map['LastName'], PhoneNumber: map['PhoneNumber'], Email: map['Email'], Password: map['Password'], CVR: map['CVR']);
}

Map<String , dynamic> toJson(){
  return {
    'FirstName': this.FirstName,
    'LastName': this.LastName,
    'PhoneNumber': this.PhoneNumber,
    'Email': this.Email,
    'Password': this.Password,
    'CVR': this.CVR
  };
}

}