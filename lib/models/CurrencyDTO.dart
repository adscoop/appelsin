class CurrencyDTO {
  final String code;

  CurrencyDTO({required this.code});

  factory CurrencyDTO.fromJson(Map<String, dynamic> json) {
    return CurrencyDTO(
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
    };
  }
}
