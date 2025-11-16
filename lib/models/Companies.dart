import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:appelsin/models/Owners.dart';

class Companies {
  int? id; // C#: Id
  String name; // C#: Name (non-null)
  int appelsinBrugerId; // C#: AppelsinBrugerId (non-null)
  String? cvr; // C#: cvr
  String? addresse; // C#: addresse
  Appelsinbruger? appelsinBruger; // C#: AppelsinBruger (navigation)
  List<Owners> owners; // C#: ICollection<Owners> Owners

  Companies({
    this.id,
    required this.name,
    required this.appelsinBrugerId,
    this.cvr,
    this.addresse,
    this.appelsinBruger,
    List<Owners>? owners,
  }) : owners = owners ?? <Owners>[];

  factory Companies.fromJson(Map<String, dynamic> json) {
    final num? _id = json['id'];
    final num? _appelsinBrugerId = json['appelsinBrugerId'];

    return Companies(
      id: _id?.toInt(),
      name: (json['Name'] ?? '') as String,
      appelsinBrugerId: (_appelsinBrugerId ?? 0).toInt(),
      cvr: json['cvr'] as String?,
      addresse: json['addresse'] as String?,
      appelsinBruger: json['AppelsinBruger'] is Map<String, dynamic>
          ? Appelsinbruger.fromJson(json['appelsinBruger'] as Map<String, dynamic>)
          : null,
      owners: json['Owners'] is List
          ? Owners.listFromJson(json['owners'] as List)
          : <Owners>[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'AppelsinBrugerId': appelsinBrugerId,
      'cvr': cvr,
      'addresse': addresse,
      'AppelsinBruger': appelsinBruger?.toJson()
    };
  }

  static List<Companies> listFromJson(List<dynamic> list) {
    return list
        .whereType<Map<String, dynamic>>()
        .map((m) => Companies.fromJson(m))
        .toList();
  }
}
