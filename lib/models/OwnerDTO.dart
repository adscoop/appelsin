class OwnerDTO{

final String fornavn;
final String efternavn;
final double ejerandel;
final String telefonnummer;
final String rolle;
 String? cpr;
final String statsborgerskab;
final String skattepligt;
 String? vejnavn_nummer;
 String? city;
 String? postnummer;
 final bool erKontaktPerson;
 final bool erDuPep;
 final bool erAndrePep;

 OwnerDTO({
  required this.fornavn,
  required this.efternavn,
  required this.ejerandel,
  required this.telefonnummer,
  required this.rolle,
   this.cpr,
  required this.statsborgerskab,
  required this.skattepligt,
this.vejnavn_nummer,
   this.postnummer,
   this.city,
   required this.erKontaktPerson,
   required this.erDuPep,
   required this.erAndrePep,
});

factory OwnerDTO.fromJson(Map<String, dynamic> map) {
  return OwnerDTO(
      fornavn: map['fornavn'] as String,
      efternavn: map['efternavn'] as String,
      ejerandel: (map['ejerandel'] as num).toDouble(),
      telefonnummer: map['telefonnummer'] as String,
      rolle: map['rolle'] as String,
      cpr: map['cpr'] as String?,
      statsborgerskab: map['statsborgerskab'] as String,
      skattepligt: map['skattepligt'] as String,
      vejnavn_nummer: map['vejnavn_nummer'] as String?,
      city: map['city'] as String?,
      postnummer: map['postnummer'] as String?,
      erKontaktPerson: (map['erKontaktPerson'] as bool?) ?? false,
      erDuPep: (map['erDuPep'] as bool?) ?? false,
      erAndrePep: (map['erAndrePep'] as bool?) ?? false,
  );
}

Map<String, dynamic> toJson() {

  return {
    'fornavn': fornavn,
    'efternavn': efternavn,
    'ejerandel': ejerandel,
    'telefonnummer': telefonnummer,
    'rolle': rolle,
    'cpr': cpr,
    'statsborgerskab': statsborgerskab,
    'skattepligt': skattepligt,
    'vejnavn_nummer': vejnavn_nummer,
    'city': city,
    'postnummer': postnummer,
    'erKontaktPerson': erKontaktPerson,
    'erDuPep': erDuPep,
    'erAndrePep': erAndrePep,
  };
}

}