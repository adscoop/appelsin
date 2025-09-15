class Customer {
  final String name;
  final String vejnavn;
  final int nummer;
  final int postnummer;
  final String by;
  final List<String> emails;
  final String telefon;
  final String? cvr; // optional
  final String? cpr; // optional
final String country;
final String email;
  Customer({
    required this.name,
    required this.vejnavn,
    required this.nummer,
    required this.postnummer,
    required this.by,
    required this.telefon,
    required this.emails,
    this.cvr,
    this.cpr,
    required this.country,
    required this.email
  });

  factory Customer.fromJson(Map<String, dynamic> maop) {
    return Customer(
      name: maop['name'] as String? ?? '',
      vejnavn: maop['vejnavn'] as String? ?? '',
      nummer: (maop['nummer'] as num?)?.toInt() ?? 0,
      postnummer: (maop['postnummer'] as num?)?.toInt() ?? 0,
      by: maop['by'] as String? ?? '',
      telefon: maop['telefon'] as String? ?? '',
      emails: (maop['emails'] as List?)
              ?.whereType<String>()
              .toList() ??
          const [],
      cvr: maop['cvr'] as String?, // optional
      cpr: maop['cpr'] as String?,
      country: maop['country'] as String ?? '',
      email:  maop['email'] as String? ?? ''// optional
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'navn': name,
      'vejnavn': vejnavn,
      'nummer': nummer,
      'postnummer': postnummer,
      'by': by,
      'telefon': telefon,
      'emails': emails,
    'country': country,
      'email': email
    };
    if (cvr != null) map['cvr'] = cvr;
    if (cpr != null) map['cpr'] = cpr;

    return map;
  }
}