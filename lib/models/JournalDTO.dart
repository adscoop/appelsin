class JournalDTO {
  final int journalNumber;
  final String name;

  JournalDTO({
    required this.journalNumber,
    required this.name,
  });

  factory JournalDTO.fromJson(Map<String, dynamic> json) {
    return JournalDTO(
      journalNumber: json['journalNumber'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'journalNumber': journalNumber,
      'name': name,
    };
  }
}
