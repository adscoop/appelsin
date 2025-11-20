class Owners {
  int? id;
  String? fornavn;
  String? efternavn;
  double? ejerandle;
  String? telefon;
  String? rolle;
  int? cpr;
  String? statsborge;
  String? skattepligt;
  String? addresse;
  bool? er_kontaktpersom;
  bool? erpep;
  int? cvr_id;
  Map<String, dynamic>? cvr; // Use a loose type until a Companies model exists

  Owners({
    this.id,
    this.fornavn,
    this.efternavn,
    this.ejerandle,
    this.telefon,
    this.rolle,
    this.cpr,
    this.statsborge,
    this.skattepligt,
    this.addresse,
    this.er_kontaktpersom,
    this.erpep,
    this.cvr_id,
    this.cvr,
  });

  factory Owners.fromJson(Map<String, dynamic> json) {
    num? _ejer = json['ejerandle'];
    num? _cpr = json['cpr'];
    num? _cvrId = json['cvr_id'];

    return Owners(
      id: json['id'] is num ? (json['id'] as num).toInt() : json['id'],
      fornavn: json['fornavn'],
      efternavn: json['efternavn'],
      ejerandle: _ejer?.toDouble(),
      telefon: json['telefon'],
      rolle: json['rolle'],
      cpr: _cpr?.toInt(),
      statsborge: json['statsborge'],
      skattepligt: json['skattepligt'],
      addresse: json['addresse'],
      er_kontaktpersom: json['er_kontaktpersom'],
      erpep: json['erpep'],
      cvr_id: _cvrId?.toInt(),
      cvr: json['cvr'] is Map<String, dynamic> ? (json['cvr'] as Map<String, dynamic>) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fornavn': fornavn,
      'efternavn': efternavn,
      'ejerandle': ejerandle,
      'telefon': telefon,
      'rolle': rolle,
      'cpr': cpr,
      'statsborge': statsborge,
      'skattepligt': skattepligt,
      'addresse': addresse,
      'er_kontaktpersom': er_kontaktpersom,
      'erpep': erpep,
      'cvr_id': cvr_id,
      'cvr': cvr,
    };
  }

  static List<Owners> listFromJson(List<dynamic> list) {
    return list.map((e) => Owners.fromJson(e as Map<String, dynamic>)).toList();
  }
}
