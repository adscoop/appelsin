import 'PaymentTermsDTO.dart';


import 'VatZoneDTO.dart';
import 'SupplierGroupDTO.dart';
class SupplierDTO {
  final int supplierNumber;
  final String name;
  final String currency;
  final PaymentTermsDTO paymentTerms;
  final VatZoneDTO vatZone;
  final SupplierGroupDTO supplierGroup;
  final String corporateIdentificationNumber;

  SupplierDTO({
    required this.supplierNumber,
    required this.name,
    required this.currency,
    required this.paymentTerms,
    required this.vatZone,
    required this.supplierGroup,
    required this.corporateIdentificationNumber,
  });

  factory SupplierDTO.fromJson(Map<String, dynamic> json) {
    return SupplierDTO(
      supplierNumber: json['supplierNumber'],
      name: json['name'],
      currency: json['currency'],
      paymentTerms: PaymentTermsDTO.fromJson(json['paymentTerms']),
      vatZone: VatZoneDTO.fromJson(json['vatZone']),
      supplierGroup: SupplierGroupDTO.fromJson(json['supplierGroup']),
      corporateIdentificationNumber: json['corporateIdentificationNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'supplierNumber': supplierNumber,
      'name': name,
      'currency': currency,
      'paymentTerms': paymentTerms.toJson(),
      'vatZone': vatZone.toJson(),
      'supplierGroup': supplierGroup.toJson(),
      'corporateIdentificationNumber': corporateIdentificationNumber,
    };
  }
}
