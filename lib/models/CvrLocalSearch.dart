// Helpers to detect presence of address info in loose API payloads
bool _hasText(dynamic v) => v is String && v.trim().isNotEmpty;

String? _valForKeys(Map<String, dynamic> map, List<String> keys) {
  for (final k in keys) {
    final v = map[k];
    if (_hasText(v)) return v as String;
  }
  return null;
}

Map<String, dynamic>? _mapForKeys(Map<String, dynamic> map, List<String> keys) {
  for (final k in keys) {
    final v = map[k];
    if (v is Map) return (v as Map).cast<String, dynamic>();
  }
  return null;
}

// Determine whether an item map contains address info. Accepts either a single
// address string or a combination of street + (zip or city). Handles common
// English and Danish key variants and both lower/Pascal casing.
bool _hasAddressMap(Map<String, dynamic> m) {
  // 1) Direct address string
  final addr = _valForKeys(m, const [
    'address', 'Address', 'adresse', 'Adresse'
  ]);
  if (addr != null) return true;

  // 2) Nested address object
  final nested = _mapForKeys(m, const [
    'address', 'Address', 'adresse', 'Adresse'
  ]);
  if (nested != null) {
    final hasStreet = _valForKeys(nested, const [
          'street', 'Street', 'vejnavn', 'Vejnavn', 'vej', 'Vej', 'vejNavn'
        ]) !=
        null;
    final hasZip = _valForKeys(nested, const [
          'zip', 'Zip', 'zipcode', 'zipCode', 'ZipCode', 'postnr', 'Postnr',
          'postNr', 'PostNr', 'postalCode', 'PostalCode', 'postnummer', 'Postnummer'
        ]) !=
        null;
    final hasCity = _valForKeys(nested, const [
          'city', 'City', 'by', 'By', 'town', 'Town', 'postdistrikt', 'Postdistrikt'
        ]) !=
        null;
    if (hasStreet && (hasZip || hasCity)) return true;
  }

  // 3) Flat fields on root
  final hasStreet = _valForKeys(m, const [
        'street', 'Street', 'vejnavn', 'Vejnavn', 'vej', 'Vej', 'vejNavn'
      ]) !=
      null;
  final hasZip = _valForKeys(m, const [
        'zip', 'Zip', 'zipcode', 'zipCode', 'ZipCode', 'postnr', 'Postnr',
        'postNr', 'PostNr', 'postalCode', 'PostalCode', 'postnummer', 'Postnummer'
      ]) !=
      null;
  final hasCity = _valForKeys(m, const [
        'city', 'City', 'by', 'By', 'town', 'Town', 'postdistrikt', 'Postdistrikt'
      ]) !=
      null;

  return hasStreet && (hasZip || hasCity);
}

class BusinessKey {
  final String key;
  final String type;

  const BusinessKey({this.key = '', this.type = ''});

  factory BusinessKey.fromJson(Map<String, dynamic> json) => BusinessKey(
        key: (json['key'] ?? json['Key'] ?? '').toString(),
        type: (json['type'] ?? json['Type'] ?? '').toString(),
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'type': type,
      };
}

class Adresse {
  final String anvendelse;
  final String adresseId;
  final String vejkode;
  final String vejnavn;
  final String husnummerFra;
  final String? husnummerTil;
  final String? etage;
  final String? doer;
  final String postnummer;
  final String postdistrikt;
  final String? supplerendeBynavn;
  final String kommunenavn;
  final String kommunekode;
  final String landekode;
  final String? postboks;
  final String? adresseFritekst;
  final String? coNavn;
  final DateTime? registreringFra;
  final DateTime? registreringTil;
  final DateTime? virkningFra;
  final DateTime? virkningTil;
  final DateTime? updated;

  const Adresse({
    this.anvendelse = '',
    this.adresseId = '',
    this.vejkode = '',
    this.vejnavn = '',
    this.husnummerFra = '',
    this.husnummerTil,
    this.etage,
    this.doer,
    this.postnummer = '',
    this.postdistrikt = '',
    this.supplerendeBynavn,
    this.kommunenavn = '',
    this.kommunekode = '',
    this.landekode = '',
    this.postboks,
    this.adresseFritekst,
    this.coNavn,
    this.registreringFra,
    this.registreringTil,
    this.virkningFra,
    this.virkningTil,
    this.updated,
  });

  static DateTime? _parseDate(dynamic v) {
    if (v == null) return null;
    try {
      return DateTime.parse(v.toString());
    } catch (_) {
      return null;
    }
  }

  factory Adresse.fromJson(Map<String, dynamic> json) => Adresse(
        anvendelse: (json['anvendelse'] ?? json['Anvendelse'] ?? '').toString(),
        adresseId: (json['adresseId'] ?? json['AdresseId'] ?? '').toString(),
        vejkode: (json['vejkode'] ?? json['Vejkode'] ?? json['vejKode'] ?? '').toString(),
        vejnavn: (json['vejnavn'] ?? json['Vejnavn'] ?? json['vej'] ?? '').toString(),
        husnummerFra: (json['husnummerFra'] ?? json['HusnummerFra'] ?? json['husnr'] ?? '').toString(),
        husnummerTil: (json['husnummerTil'] ?? json['HusnummerTil'])?.toString(),
        etage: (json['etage'] ?? json['Etage'])?.toString(),
        doer: (json['doer'] ?? json['Dør'] ?? json['Doer'])?.toString(),
        postnummer: (json['postnummer'] ?? json['Postnummer'] ?? json['postnr'] ?? '').toString(),
        postdistrikt: (json['postdistrikt'] ?? json['Postdistrikt'] ?? json['by'] ?? '').toString(),
        supplerendeBynavn: (json['supplerendeBynavn'] ?? json['SupplerendeBynavn'])?.toString(),
        kommunenavn: (json['kommunenavn'] ?? json['Kommunenavn'] ?? '') .toString(),
        kommunekode: (json['kommunekode'] ?? json['Kommunekode'] ?? '') .toString(),
        landekode: (json['landekode'] ?? json['Landekode'] ?? json['land'] ?? '').toString(),
        postboks: (json['postboks'] ?? json['Postboks'])?.toString(),
        adresseFritekst: (json['adresseFritekst'] ?? json['AdresseFritekst'])?.toString(),
        coNavn: (json['coNavn'] ?? json['CoNavn'] ?? json['c/o'])?.toString(),
        registreringFra: _parseDate(json['registreringFra'] ?? json['RegistreringFra']),
        registreringTil: _parseDate(json['registreringTil'] ?? json['RegistreringTil']),
        virkningFra: _parseDate(json['virkningFra'] ?? json['VirkningFra']),
        virkningTil: _parseDate(json['virkningTil'] ?? json['VirkningTil']),
        updated: _parseDate(json['updated'] ?? json['Updated'] ?? json['opdateret']),
      );

  Map<String, dynamic> toJson() => {
        'anvendelse': anvendelse,
        'adresseId': adresseId,
        'vejkode': vejkode,
        'vejnavn': vejnavn,
        'husnummerFra': husnummerFra,
        'husnummerTil': husnummerTil,
        'etage': etage,
        'doer': doer,
        'postnummer': postnummer,
        'postdistrikt': postdistrikt,
        'supplerendeBynavn': supplerendeBynavn,
        'kommunenavn': kommunenavn,
        'kommunekode': kommunekode,
        'landekode': landekode,
        'postboks': postboks,
        'adresseFritekst': adresseFritekst,
        'coNavn': coNavn,
        'registreringFra': registreringFra?.toUtc().toIso8601String(),
        'registreringTil': registreringTil?.toUtc().toIso8601String(),
        'virkningFra': virkningFra?.toUtc().toIso8601String(),
        'virkningTil': virkningTil?.toUtc().toIso8601String(),
        'updated': updated?.toUtc().toIso8601String(),
      };

  String get line1 {
    final parts = <String>[];
    if (vejnavn.isNotEmpty) parts.add(vejnavn);
    final hus = [husnummerFra, if (husnummerTil != null && husnummerTil!.isNotEmpty) '-${husnummerTil!}']
        .where((e) => e != null && e.toString().isNotEmpty)
        .join('');
    if (hus.isNotEmpty) parts.add(hus);
    return parts.join(' ');
  }

  String get line2 {
    final parts = <String>[];
    if (postnummer.isNotEmpty) parts.add(postnummer);
    if (postdistrikt.isNotEmpty) parts.add(postdistrikt);
    return parts.join(' ');
  }

  String get formatted => [line1, if (supplerendeBynavn != null && supplerendeBynavn!.isNotEmpty) supplerendeBynavn!, line2]
      .where((e) => e.toString().trim().isNotEmpty)
      .join(', ');
}

class MetaInfo {
  final String enhedsType;
  final DateTime? updated;

  const MetaInfo({this.enhedsType = '', this.updated});

  factory MetaInfo.fromJson(Map<String, dynamic> json) => MetaInfo(
        enhedsType: (json['enhedsType'] ?? json['EnhedsType'] ?? '').toString(),
        updated: Adresse._parseDate(json['updated'] ?? json['Updated']),
      );

  Map<String, dynamic> toJson() => {
        'enhedsType': enhedsType,
        'updated': updated?.toUtc().toIso8601String(),
      };
}

class CvrLocalSearchItem {
  // New API provides lowercase 'id'; keep tolerant mapping from legacy 'CVREnhedsId'
  final String id; // maps API 'id' / legacy CVREnhedsId
  final String name; // API 'name'
  final double score; // API 'score'
  final String status; // API 'status'
  final List<BusinessKey> businessKeys; // API 'businessKeys'
  final Adresse? adresse; // API 'adresse'
  final MetaInfo? meta; // API 'meta'

  const CvrLocalSearchItem({
    this.id = '',
    this.name = '',
    this.score = 0.0,
    this.status = '',
    this.businessKeys = const <BusinessKey>[],
    this.adresse,
    this.meta,
  });

  factory CvrLocalSearchItem.fromJson(Map<String, dynamic> json) {
    final num? scoreNum = (json['score'] as num?) ?? (json['Score'] as num?);
    final addrMap = (_mapForKeys(json, const ['adresse', 'Adresse', 'address', 'Address']));
    final metaMap = (_mapForKeys(json, const ['meta', 'Meta']));
    final bkList = (json['businessKeys'] as List?) ?? (json['BusinessKeys'] as List?) ?? const [];
    return CvrLocalSearchItem(
      id: (json['id'] as String?) ?? (json['CVREnhedsId'] as String?) ?? '',
      name: (json['name'] as String?) ?? (json['Name'] as String?) ?? '',
      score: scoreNum?.toDouble() ?? 0.0,
      status: (json['status'] ?? json['Status'] ?? '').toString(),
      businessKeys: bkList
          .whereType<Map>()
          .map((e) => BusinessKey.fromJson((e as Map).cast<String, dynamic>()))
          .toList(growable: false),
      adresse: addrMap != null ? Adresse.fromJson(addrMap) : null,
      meta: metaMap != null ? MetaInfo.fromJson(metaMap) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        // Emit lowercase keys to match the new /local-search API
        'id': id,
        'name': name,
        'score': score,
        'status': status,
        'businessKeys': businessKeys.map((e) => e.toJson()).toList(growable: false),
        'adresse': adresse?.toJson(),
        'meta': meta?.toJson(),
      };

  CvrLocalSearchItem copyWith({
    String? id,
    String? name,
    double? score,
    String? status,
    List<BusinessKey>? businessKeys,
    Adresse? adresse,
    MetaInfo? meta,
  }) => CvrLocalSearchItem(
        id: id ?? this.id,
        name: name ?? this.name,
        score: score ?? this.score,
        status: status ?? this.status,
        businessKeys: businessKeys ?? this.businessKeys,
        adresse: adresse ?? this.adresse,
        meta: meta ?? this.meta,
      );

  String? get formattedAddress => adresse?.formatted.isNotEmpty == true ? adresse!.formatted : null;
}

class CvrLocalSearchResult {
  final int total;
  final int page;
  final int pageSize;
  final List<CvrLocalSearchItem> items;

  const CvrLocalSearchResult({
    this.total = 0,
    this.page = 1,
    this.pageSize = 0,
    this.items = const <CvrLocalSearchItem>[],
  });

  factory CvrLocalSearchResult.fromJson(Map<String, dynamic> json) {
    final list = (json['items'] as List?) ?? (json['Items'] as List?) ?? const [];
    final filtered = list
        .whereType<Map<String, dynamic>>()
        .where(_hasAddressMap)
        .toList(growable: false);
    return CvrLocalSearchResult(
      total: (json['total'] as num?)?.toInt() ?? (json['Total'] as num?)?.toInt() ?? 0,
      page: (json['page'] as num?)?.toInt() ?? (json['Page'] as num?)?.toInt() ?? 1,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? (json['PageSize'] as num?)?.toInt() ?? 0,
      items: filtered
          .map((e) => CvrLocalSearchItem.fromJson(e))
          .toList(growable: false),
    );
  }

  Map<String, dynamic> toJson() => {
        'total': total,
        'page': page,
        'pageSize': pageSize,
        'items': items.map((e) => e.toJson()).toList(growable: false),
      };

  CvrLocalSearchResult copyWith({
    int? total,
    int? page,
    int? pageSize,
    List<CvrLocalSearchItem>? items,
  }) => CvrLocalSearchResult(
        total: total ?? this.total,
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
        items: items ?? this.items,
      );
}
