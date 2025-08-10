
class Loginmodel {

  final String User;
  final String Password;

   Loginmodel({
    required this.User,
     required  this.Password
}) ;

  factory Loginmodel.fromJsom(Map<String, dynamic>   map) {
    return Loginmodel(User: map['User'], Password: map['Password']);
  }

  Map<String, dynamic> toJson(){
    return {
      'User': this.User,
      'Password': this.Password
    };
  }
}
