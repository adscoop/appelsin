import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/invoices/CustomerListWidget.dart';
import 'package:appelsin/models/Customer.dart';
import 'package:appelsin/models/InvoiceLine.dart';
class InvoiceWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InvoiceWidget();
}

class _InvoiceWidget extends State<InvoiceWidget> {

  late Customer customer;
bool isCustomerChoosen = false;
Set<int> _selection = {0}; // Single-select: start med første valgt
  List<>
  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(length: 2, child:
      Scaffold(
      appBar: AppBar(
    title:  Text('Opret ny indtægt'),
    bottom:  TabBar(
        tabs: [

          Container(
            width: 160,
            height: 40,
            alignment: Alignment.center,
            child: Text('Faktura'),
          ),
          Container(
            width: 160,
            height: 40,
            alignment: Alignment.center,
            child: Text('Tilbud'),
          ),

        ],
    ),
  ),
body:  TabBarView(
          children: [
        createInvoice(context),
            createOffer(context)
        ],
      )
    ));
  }

  Widget createInvoice(BuildContext context){
    return SingleChildScrollView(
      child: Column(

        children: [
          Container(
            margin: EdgeInsets.only(left: 16, top: 10),
            alignment: Alignment.topLeft,
            child: Text("Kunde") ,
          ),
          if(!isCustomerChoosen)
          Container(
            alignment: Alignment.center,
              child: ElevatedButton(onPressed: (){
                navigateWithSlide(context, CustomerListWidget(addCustomer: addCustomer), SlideDirection.left);
                
              }, child: Text(
                'Vælg kunde',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                  fontSize: 16,
                  fontFamily: 'Figtree',
                  fontWeight: FontWeight.w600,
                  height: 1.50,
                ),
              )),
          ),
          if(isCustomerChoosen)
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 370,
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: const Color(0xFFF9F7F4) /* primary-dark-brown-beige-5 */,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: const Color(0xFFEEE3D8) /* primary-dark-brown-beige-20 */,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        SizedBox(
                          width: 143,
                          height: 17,
                          child: Text(
                            customer.name,
                            style: TextStyle(
                              color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                              fontSize: 13,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w600,
                              height: 1.50,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 143,
                          height: 17,
                          child: Text(
                            customer.email,
                            style: TextStyle(
                              color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                              fontSize: 13,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                              height: 1.50,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 143,
                          height: 17,
                          child: Text(
                           customer.telefon,
                            style: TextStyle(
                              color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                              fontSize: 13,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                              height: 1.50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Stack(),
                  ),
                ],
              ),
            ),
              if(isCustomerChoosen)
              Container(
  child: SegmentedButton<int>(
    segments: [
      ButtonSegment<int>(
        value: 0,
        label: Text(
          'E-mail',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _selection.contains(0) ? Colors.white : null,
            fontSize: 16,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w600,
            height: 1.50,
          ),
        ),
      ),
      ButtonSegment<int>(
        value: 1,
        label: Text(
          'Sms',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _selection.contains(1) ? Colors.white : null,
            fontSize: 16,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w600,
            height: 1.50,
          ),
        ),
      ),
      ButtonSegment<int>(
        value: 2,
        label: Text(
          'E-mail og sms',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _selection.contains(2) ? Colors.white : null,
            fontSize: 16,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w600,
            height: 1.50,
          ),
        ),
      ),
    ],
    selected: _selection,
    onSelectionChanged: (newSelection) {
      setState(() {
        _selection = newSelection; // Single-select
      });
    }
  ),
),
          Divider(),

        ],
      ),
    );
  }
  Widget createOffer(BuildContext context) {

    return SingleChildScrollView(
      child: Column(

        children: [
          Container(
            margin: EdgeInsets.only(left: 16, top: 10),
            alignment: Alignment.topLeft,
            child: Text("Kunde") ,
          ),
          if(!isCustomerChoosen)
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(onPressed: (){
                navigateWithSlide(context, CustomerListWidget(addCustomer: addCustomer), SlideDirection.left);

              }, child: Text(
                'Vælg kunde',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                  fontSize: 16,
                  fontFamily: 'Figtree',
                  fontWeight: FontWeight.w600,
                  height: 1.50,
                ),
              )),
            ),
          if(isCustomerChoosen)
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 370,
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: const Color(0xFFF9F7F4) /* primary-dark-brown-beige-5 */,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: const Color(0xFFEEE3D8) /* primary-dark-brown-beige-20 */,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        SizedBox(
                          width: 143,
                          height: 17,
                          child: Text(
                            customer.name,
                            style: TextStyle(
                              color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                              fontSize: 13,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w600,
                              height: 1.50,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 143,
                          height: 17,
                          child: Text(
                            customer.email,
                            style: TextStyle(
                              color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                              fontSize: 13,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                              height: 1.50,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 143,
                          height: 17,
                          child: Text(
                            customer.telefon,
                            style: TextStyle(
                              color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                              fontSize: 13,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                              height: 1.50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Stack(),
                  ),
                ],
              ),
            ),
          if(isCustomerChoosen)
            Container(
              child: SegmentedButton<int>(
                  segments: [
                    ButtonSegment<int>(
                      value: 0,
                      label: Text(
                        'E-mail',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _selection.contains(0) ? Colors.white : Colors.black,
                          fontSize: 16,
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w600,
                          height: 1.50,
                        ),
                      ),
                    ),
                    ButtonSegment<int>(
                      value: 1,
                      label: Text(
                        'Sms',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _selection.contains(1) ? Colors.white : Colors.black,
                          fontSize: 16,
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w600,
                          height: 1.50,
                        ),
                      ),
                    ),
                    ButtonSegment<int>(
                      value: 2,
                      label: Text(
                        'E-mail og sms',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _selection.contains(2) ? Colors.white : Colors.black,
                          fontSize: 16,
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w600,
                          height: 1.50,
                        ),
                      ),
                    ),
                  ],
                  selected: _selection,
                  onSelectionChanged: (newSelection) {
                    setState(() {
                      _selection = newSelection; // Single-select
                    });
                  }
              ),
            ),
          if(isCustomerChoosen)
            Container(

            )
          Divider(),

        ],
      ),
    );
  }

  addCustomer(Customer value) {
    setState(() {
      customer = value;
      isCustomerChoosen = true;
    });

  }
 }
