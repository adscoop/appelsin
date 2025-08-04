import 'AccountingYearDTO.dart';
import 'JournalDTO.dart';
import 'VoucherEntriesDTO.dart';
class VoucherCompositeDTO {
  final AccountingYearDTO accountingYear;
  final JournalDTO journal;
  final VoucherEntriesDTO entries;
  final int voucherNumber;
  final String attachment;

  VoucherCompositeDTO({
    required this.accountingYear,
    required this.journal,
    required this.entries,
    required this.voucherNumber,
    required this.attachment,
  });

  factory VoucherCompositeDTO.fromJson(Map<String, dynamic> json) {
    return VoucherCompositeDTO(
      accountingYear: AccountingYearDTO.fromJson(json['accountingYear']),
      journal: JournalDTO.fromJson(json['journal']),
      entries: VoucherEntriesDTO.fromJson(json['entries']),
      voucherNumber: json['voucherNumber'],
      attachment: json['attachment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountingYear': accountingYear.toJson(),
      'journal': journal.toJson(),
      'entries': entries.toJson(),
      'voucherNumber': voucherNumber,
      'attachment': attachment,
    };
  }
}
