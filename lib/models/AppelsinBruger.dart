class Appelsinbruger {
   int? id;
final String? FirstName;  // Made nullable
final String? LastName;   // Made nullable
final String? PhoneNumber; // Made nullable
final String Email ;      // Keep required if always expected
final String? position;   // Made nullable
final int? hasPin;
 int? pin;

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
    FirstName: map['firstName'],
    LastName: map['lastName'],
    PhoneNumber: map['phoneNumber'],
    Email: map['email'] ?? '', // Keep default for required field
    position: map['position'], 
    hasPin: map['has_pin'],
    pin: map['pin']
  );
}

Map<String , dynamic> toJson(){
  return {
    'firstName': this.FirstName,
    'lastName': this.LastName,
    'PhoneNumber': this.PhoneNumber,
    'email': this.Email,
    'position' : this.position,
    'has_pin': this.hasPin,
    'pin': this.pin
  };
}

}