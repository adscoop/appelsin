class AccountingYearDTO {
  final DateTime fromDate;
  final DateTime toDate;
  final String year;

  AccountingYearDTO({
    required this.fromDate,
    required this.toDate,
    required this.year,
  });

  factory AccountingYearDTO.fromJson(Map<String, dynamic> json) {
    return AccountingYearDTO(
      fromDate: DateTime.parse(json['fromDate']),
      toDate: DateTime.parse(json['toDate']),
      year: json['year'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fromDate': fromDate.toIso8601String(),
      'toDate': toDate.toIso8601String(),
      'year': year,
    };
  }
}
