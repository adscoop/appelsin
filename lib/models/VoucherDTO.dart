import 'AccountDTO.dart';
import 'CurrencyDTO.dart';
import 'SupplierDTO.dart';
import 'PaymentDetailsDTO.dart';
class VoucherDTO {
  final String text;
  final double amount;
  final AccountDTO account;
  final AccountDTO contraAccount;
  final AccountDTO contraVatAccount;
  final CurrencyDTO currency;
  final String date;
  final AccountDTO vatAccount;
  final SupplierDTO supplier;
  final String supplierInvoiceNumber;
  final PaymentDetailsDTO paymentDetailsDto;
  final String dueDate;

  VoucherDTO({
    required this.text,
    required this.amount,
    required this.account,
    required this.contraAccount,
    required this.contraVatAccount,
    required this.currency,
    required this.date,
    required this.vatAccount,
    required this.supplier,
    required this.supplierInvoiceNumber,
    required this.paymentDetailsDto,
    required this.dueDate,
  });

  factory VoucherDTO.fromJson(Map<String, dynamic> json) {
    return VoucherDTO(
      text: json['text'],
      amount: (json['amount'] as num).toDouble(),
      account: AccountDTO.fromJson(json['account']),
      contraAccount: AccountDTO.fromJson(json['contraAccount']),
      contraVatAccount: AccountDTO.fromJson(json['contraVatAccount']),
      currency: CurrencyDTO.fromJson(json['currency']),
      date: json['date'],
      vatAccount: AccountDTO.fromJson(json['vatAccount']),
      supplier: SupplierDTO.fromJson(json['supplier']),
      supplierInvoiceNumber: json['supplierInvoiceNumber'],
      paymentDetailsDto: PaymentDetailsDTO.fromJson(json['paymentDetailsDto']),
      dueDate: json['dueDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'amount': amount,
      'account': account.toJson(),
      'contraAccount': contraAccount.toJson(),
      'contraVatAccount': contraVatAccount.toJson(),
      'currency': currency.toJson(),
      'date': date,
      'vatAccount': vatAccount.toJson(),
      'supplier': supplier.toJson(),
      'supplierInvoiceNumber': supplierInvoiceNumber,
      'paymentDetailsDto': paymentDetailsDto.toJson(),
      'dueDate': dueDate,
    };
  }
}
