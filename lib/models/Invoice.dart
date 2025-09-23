import 'package:appelsin/models/Customer.dart';
class Invoice {
  final Customer customer;

  const Invoice({required this.customer});

  factory Invoice.fromJsom(Map<String, dynamic> map) {
    return Invoice(customer: Customer.fromJson(map['customer']));
  }


}