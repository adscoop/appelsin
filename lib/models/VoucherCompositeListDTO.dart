
import 'VoucherCompositeDTO.dart';
class VoucherCompositeListDTO {
  final List<VoucherCompositeDTO> collection;

  VoucherCompositeListDTO({
    required this.collection,
  });

  factory VoucherCompositeListDTO.fromJson(Map<String, dynamic> json) {
    return VoucherCompositeListDTO(
      collection: (json['collection'] as List)
          .map((item) => VoucherCompositeDTO.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'collection': collection.map((item) => item.toJson()).toList(),
    };
  }
}
