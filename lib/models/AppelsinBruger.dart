class Appelsinbruger {
   int? id;
final String? FirstName;  // Made nullable
final String? LastName;   // Made nullable
final String? PhoneNumber; // Made nullable
final String Email ;      // Keep required if always expected
final String? position;   // Made nullable
final int? hasPin;
final int? pin;

Appelsinbruger({
  this.id,
  this.FirstName,        // No longer required
  this.LastName,         // No longer required
  this.PhoneNumber,      // No longer required
  required this.Email,   // Keep required
  this.position,         // No longer required
  this.hasPin,
  this.pin
});

factory Appelsinbruger.fromJson(Map<String, dynamic> map) {
  return Appelsinbruger(
   id: map['id'],
    FirstName: map['FirstName'], 
    LastName: map['LastName'], 
    PhoneNumber: map['PhoneNumber'], 
    Email: map['Email'] ?? '', // Keep default for required field
    position: map['position'], 
    hasPin: map['hasPin'], 
    pin: map['pin']
  );
}

Map<String , dynamic> toJson(){
  return {
    'FirstName': this.FirstName,
    'LastName': this.LastName,
    'PhoneNumber': this.PhoneNumber,
    'Email': this.Email,
    'position' : this.position,
    'hasPin': this.hasPin,
    'pin': this.pin
  };
}

}