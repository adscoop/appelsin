import 'package:flutter/material.dart';

class InvoiceWidget extends StatelessWidget {
  final void Function(bool) createInvoice;

  const InvoiceWidget({Key? key, required this.createInvoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
       children: [

       ],
     ),
    );
  }
}
