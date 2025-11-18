/// Simpelt adresse-objekt til generel brug i appen.
/// Felter (danske navne):
/// - vejnavn
/// - husnummerFra
/// - husnummerTil (valgfri)
/// - postnummer
/// - postdistrikt
/// - bynavn (valgfri)
class Address {
  final String vejnavn;
  final int husnummerFra;
  final int? husnummerTil;
  final int postnummer;
  final String postdistrikt;
  final String? bynavn;

  const Address({
    this.vejnavn = '',
    this.husnummerFra = 0,
    this.husnummerTil,
    this.postnummer = 0,
    this.postdistrikt = '',
    this.bynavn,
  });

  /// Tolerant JSON-parser der accepterer almindelige varianter af nøgler
  /// (både dansk/engelsk og forskellig casing) og mapper til vores felter.
  factory Address.fromJson(Map<String, dynamic> json) {
    // String helper (required)
    String _firstStrOf(List<String> keys) {
      for (final k in keys) {
        final v = json[k];
        if (v is String && v.trim().isNotEmpty) return v.trim();
        if (v != null) {
          final s = v.toString().trim();
          if (s.isNotEmpty) return s;
        }
      }
      return '';
    }

    // String helper (optional)
    String? _firstStrOptOf(List<String> keys) {
      for (final k in keys) {
        final v = json[k];
        if (v == null) continue;
        final s = v.toString().trim();
        if (s.isNotEmpty) return s;
      }
      return null;
    }

    // Int helper (required; defaults to 0)
    int _firstIntOf(List<String> keys, {int defaultValue = 0}) {
      for (final k in keys) {
        final v = json[k];
        if (v == null) continue;
        if (v is int) return v;
        final s = v.toString().trim();
        if (s.isEmpty) continue;
        final parsed = int.tryParse(s);
        if (parsed != null) return parsed;
      }
      return defaultValue;
    }

    // Int helper (optional)
    int? _firstIntOptOf(List<String> keys) {
      for (final k in keys) {
        final v = json[k];
        if (v == null) continue;
        if (v is int) return v;
        final s = v.toString().trim();
        if (s.isEmpty) continue;
        final parsed = int.tryParse(s);
        if (parsed != null) return parsed;
      }
      return null;
    }

    final vejnavn = _firstStrOf(['vejnavn', 'Vejnavn', 'street', 'Street', 'vej']);
    final husnummerFra = _firstIntOf(['husnummerFra', 'HusnummerFra', 'houseNumber', 'houseNumberFrom']);
    final husnummerTil = _firstIntOptOf(['husnummerTil', 'HusnummerTil', 'houseNumberTo']);
    final postnummer = _firstIntOf(['postnummer', 'Postnummer', 'postnr', 'postalCode', 'zip', 'Zip']);
    final postdistrikt = _firstStrOf(['postdistrikt', 'Postdistrikt', 'city', 'City', 'by']);
    // bynavn kan i CVR-data ofte hedde supplerendeBynavn
    final bynavn = _firstStrOptOf(['bynavn', 'Bynavn', 'supplerendeBynavn', 'SupplerendeBynavn']);

    return Address(
      vejnavn: vejnavn,
      husnummerFra: husnummerFra,
      husnummerTil: husnummerTil,
      postnummer: postnummer,
      postdistrikt: postdistrikt,
      bynavn: bynavn,
    );
  }

  Map<String, dynamic> toJson() => {
        'vejnavn': vejnavn,
        'husnummerFra': husnummerFra,
        if (husnummerTil != null) 'husnummerTil': husnummerTil,
        'postnummer': postnummer,
        'postdistrikt': postdistrikt,
        if (bynavn != null) 'bynavn': bynavn,
      };

  /// Pæn, menneskeligt læsbar adresse.
  String get formatted {
    final parts = <String>[];
    // Husnummer-range: e.g., 10-12 if both set, else just 10
    String hus = '';
    if (husnummerFra > 0) {
      hus = husnummerTil != null && husnummerTil! > 0
          ? '${husnummerFra}-${husnummerTil}'
          : husnummerFra.toString();
    }
    if (vejnavn.isNotEmpty) {
      parts.add('${vejnavn}${hus.isNotEmpty ? ' $hus' : ''}');
    }
    if ((bynavn ?? '').isNotEmpty) parts.add(bynavn!);
    final line2 = [
      if (postnummer > 0) postnummer.toString(),
      if (postdistrikt.length > 0) postdistrikt.toString(),
    ].join(' ').trim();
    if (line2.isNotEmpty) parts.add(line2);
    return parts.join(', ');
  }

  bool get isEmpty =>
      vejnavn.isEmpty && husnummerFra == 0 && postnummer == 0 && postdistrikt == 0 && (bynavn ?? '').isEmpty;

  bool get isValid => vejnavn.isNotEmpty && postnummer > 0 && postdistrikt.length > 0;
}
