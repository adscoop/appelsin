class CvrSearchResult {
  final String queryName;
  final DateTime timestampUsed;
  final List<NavnItem> navn;
  final List<Enhed> enheder;

  CvrSearchResult({
    required this.queryName,
    required this.timestampUsed,
    required this.navn,
    required this.enheder,
  });

  factory CvrSearchResult.fromJson(Map<String, dynamic> json) {
    // Be tolerant: some payloads may omit meta fields or use different casing
    final String query = (json['queryName'] ?? json['query'] ?? '').toString();
    DateTime ts;
    final tsRaw = json['timestampUsed'] ?? json['timestamp'] ?? json['ts'];
    if (tsRaw is String) {
      try {
        ts = DateTime.parse(tsRaw);
      } catch (_) {
        ts = DateTime.now();
      }
    } else {
      ts = DateTime.now();
    }
    final navnList = (json['navn'] ?? json['Navn'] ?? json['names']) as List<dynamic>? ?? const [];
    final enhederList = (json['enheder'] ?? json['Enheder'] ?? json['units']) as List<dynamic>? ?? const [];

    return CvrSearchResult(
      queryName: query,
      timestampUsed: ts,
      navn: navnList.map((e) => NavnItem.fromJson((e as Map).cast<String, dynamic>())).toList(),
      enheder: enhederList.map((e) => Enhed.fromJson((e as Map).cast<String, dynamic>())).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'queryName': queryName,
        'timestampUsed': timestampUsed.toUtc().toIso8601String(),
        'navn': navn.map((e) => e.toJson()).toList(),
        'enheder': enheder.map((e) => e.toJson()).toList(),
      };
}

class NavnItem {
  final String cvrEnhedsId;
  final int sekvens;
  final String vaerdi;
  final String feltliste;

  NavnItem({
    required this.cvrEnhedsId,
    required this.sekvens,
    required this.vaerdi,
    required this.feltliste,
  });

  factory NavnItem.fromJson(Map<String, dynamic> json) => NavnItem(
        cvrEnhedsId: json['cvrEnhedsId']?.toString() ?? '',
        sekvens: (json['sekvens'] is int)
            ? json['sekvens'] as int
            : int.tryParse(json['sekvens']?.toString() ?? '0') ?? 0,
        vaerdi: json['vaerdi'] as String? ?? '',
        feltliste: json['feltliste'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'cvrEnhedsId': cvrEnhedsId,
        'sekvens': sekvens,
        'vaerdi': vaerdi,
        'feltliste': feltliste,
      };
}

class Enhed {
  final DateTime datafordelerOpdateringstid;
  final String enhedsType;
  final String feltliste;
  final String forretningsnoegletype;
  final String id;
  final String status;
  final String forretningsnoegle;

  Enhed({
    required this.datafordelerOpdateringstid,
    required this.enhedsType,
    required this.feltliste,
    required this.forretningsnoegletype,
    required this.id,
    required this.status,
    required this.forretningsnoegle,
  });

  factory Enhed.fromJson(Map<String, dynamic> json) {
    // Tolerant parsing with alternative key casings
    DateTime parsedDate;
    final rawDate = (json['datafordelerOpdateringstid'] ?? json['DatafordelerOpdateringstid'] ?? json['opdateringstid'] ?? json['updatedAt']);
    if (rawDate is String) {
      try {
        parsedDate = DateTime.parse(rawDate);
      } catch (_) {
        parsedDate = DateTime.now();
      }
    } else {
      parsedDate = DateTime.now();
    }
    return Enhed(
      datafordelerOpdateringstid: parsedDate,
      enhedsType: (json['enhedsType'] ?? json['EnhedsType'] ?? '').toString(),
      feltliste: (json['feltliste'] ?? json['Feltliste'] ?? '').toString(),
      forretningsnoegletype: (json['forretningsnoegletype'] ?? json['Forretningsnoegletype'] ?? '').toString(),
      id: (json['id'] ?? json['ID'] ?? '').toString(),
      status: (json['status'] ?? json['Status'] ?? '').toString(),
      forretningsnoegle: (json['forretningsnoegle'] ?? json['Forretningsnoegle'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'datafordelerOpdateringstid':
            datafordelerOpdateringstid.toUtc().toIso8601String(),
        'enhedsType': enhedsType,
        'feltliste': feltliste,
        'forretningsnoegletype': forretningsnoegletype,
        'id': id,
        'status': status,
        'forretningsnoegle': forretningsnoegle,
      };
}
