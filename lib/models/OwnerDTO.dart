class OwnerDTO{

final String fornavn;
final String efternavn;
final double ejerandel;
final String telefonnummer;
final String rolle;
final String cpr;
final String statsborgerskab;
final String skattepligt;
final String vejnavn_nummer;
final String city;
final String postnummer;
final bool erKontaktPerson;
final bool erDuPep;
final bool erAndrePep;

const OwnerDTO({
  required this.fornavn,
  required this.efternavn,
  required this.ejerandel,
  required this.telefonnummer,
  required this.rolle,
  required this.cpr,
  required this.statsborgerskab,
  required this.skattepligt,
  required this.vejnavn_nummer,
  required this.city,
  required this.postnummer,
  required this.erKontaktPerson,
  required this.erDuPep,
  required this.erAndrePep
});

factory OwnerDTO.fromJson(Map<String, dynamic> map) {
  return OwnerDTO(fornavn: map['fornavn'], efternavn: map['efternavn'], ejerandel: map['ejerandel'], telefonnummer: map['telefonnummer'], rolle: map['rolle'], cpr:  map['cpr'], statsborgerskab: map['statsborgerskab'], skattepligt:  map['skattepligt'], vejnavn_nummer: map['vejnavn_nummer'], city: map['city'], postnummer:map['postnummer'], erKontaktPerson: map['erKontaktPerson'], erDuPep: map['erDuPep'], erAndrePep: map['erAndrePep']);
}

Map<String, dynamic> toJson() {

  return {

  };
}

}