class AccountDTO {
  final int accountNumber;
  final String accountType;
  final double debitCredit;
  final String name;
  final String vatCode;

  AccountDTO({
    required this.accountNumber,
    required this.accountType,
    required this.debitCredit,
    required this.name,
    required this.vatCode,
  });

  factory AccountDTO.fromJson(Map<String, dynamic> json) {
    return AccountDTO(
      accountNumber: json['accountNumber'],
      accountType: json['accountType'],
      debitCredit: (json['debitCredit'] as num).toDouble(),
      name: json['name'],
      vatCode: json['vatCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountNumber': accountNumber,
      'accountType': accountType,
      'debitCredit': debitCredit,
      'name': name,
      'vatCode': vatCode,
    };
  }
}
