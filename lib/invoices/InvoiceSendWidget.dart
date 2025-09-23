import 'package:flutter/material.dart';
import 'package:appelsin/models/Invoice.dart';
class InvoiceSendWidget extends StatefulWidget {
  final Invoice invoice;

  const InvoiceSendWidget({Key? key, required this.invoice});

  @override
  State<StatefulWidget> createState() => _InvoiceSendWidget();
}

class _InvoiceSendWidget extends State<InvoiceSendWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Opret ny indtægt',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF231303), // primary-dark-brown-dark-brown-200
            fontSize: 20,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                width: 370,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // spacing: 24, // Column doesn't have 'spacing' in Flutter stable. Use SizedBox instead if needed.
                  children: [
                    SizedBox(
                      width: 370,
                      child: Text(
                        'Din faktura er sendt afsted til Lone Jensen ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF231303), // primary-dark-brown-dark-brown-200
                          fontSize: 18,
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w400,
                          height: 1.33,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // spacing: 8,
                      children: [
                        SizedBox(
                          width: 370,
                          child: Text(
                            '4.151,50 kr',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF29C678), // secondary-attention-green-attention-green-100
                              fontSize: 36,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: 370,
                          child: Text(
                            'Inkl. moms',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF392919), // primary-dark-brown-dark-brown-100
                              fontSize: 12,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}