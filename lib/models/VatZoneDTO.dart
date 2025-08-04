class VatZoneDTO {
  final int vatZoneNumber;

  VatZoneDTO({required this.vatZoneNumber});

  factory VatZoneDTO.fromJson(Map<String, dynamic> json) {
    return VatZoneDTO(
      vatZoneNumber: json['vatZoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vatZoneNumber': vatZoneNumber,
    };
  }
}
