
import 'VoucherDTO.dart';
class VoucherEntriesDTO {
  final List<VoucherDTO> financeVouchers;
  final List<VoucherDTO> supplierInvoices;

  VoucherEntriesDTO({
    required this.financeVouchers,
    required this.supplierInvoices,
  });

  factory VoucherEntriesDTO.fromJson(Map<String, dynamic> json) {
    return VoucherEntriesDTO(
      financeVouchers: (json['financeVouchers'] as List)
          .map((item) => VoucherDTO.fromJson(item))
          .toList(),
      supplierInvoices: (json['supplierInvoices'] as List)
          .map((item) => VoucherDTO.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'financeVouchers': financeVouchers.map((v) => v.toJson()).toList(),
      'supplierInvoices': supplierInvoices.map((v) => v.toJson()).toList(),
    };
  }
}
