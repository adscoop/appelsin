import 'CategoryGroup.dart';

class CategoryDTO {
  final int id;
  final String title;
  final String description;
  final String erpAccountNumber;
  final String erpVatCode;
  final String iconPath;
  final CategoryGroup? categoryGroup;
  final bool deprecated;
  final String erpAccountId;
  final String? accountType;
  final String? prCategory;

  CategoryDTO({
    required this.id,
    required this.title,
    required this.description,
    required this.erpAccountNumber,
    required this.erpVatCode,
    required this.iconPath,
    this.categoryGroup,
    required this.deprecated,
    required this.erpAccountId,
    this.accountType,
    this.prCategory,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) {
    return CategoryDTO(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      erpAccountNumber: json['erpAccountNumber'],
      erpVatCode: json['erpVatCode'],
      iconPath: json['iconPath'],
      categoryGroup: json['categoryGroup'] != null
          ? CategoryGroup.fromJson(json['categoryGroup'])
          : null,
      deprecated: json['deprecated'] ?? false,
      erpAccountId: json['erpAccountId'],
      accountType: json['accountType'],
      prCategory: json['prCategory'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'erpAccountNumber': erpAccountNumber,
      'erpVatCode': erpVatCode,
      'iconPath': iconPath,
      'categoryGroup': categoryGroup?.toJson(),
      'deprecated': deprecated,
      'erpAccountId': erpAccountId,
      'accountType': accountType,
      'prCategory': prCategory,
    };
  }
}
