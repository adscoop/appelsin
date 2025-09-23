import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/invoices/CustomerListWidget.dart';
import 'package:appelsin/models/Customer.dart';
import 'package:appelsin/models/InvoiceLine.dart';
import 'package:appelsin/models/Product.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:sliding_action_button/sliding_action_button.dart';

class InvoiceWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InvoiceWidget();
}

class _InvoiceWidget extends State<InvoiceWidget> {
  Product? _selectedProduct;
  final List<Product> _products = [
    Product(varnr: 'P001', beskrivelse: 'Konsulenttimer', pris: 750.0),
    Product(varnr: 'P002', beskrivelse: 'Website design', pris: 12000.0),
    Product(varnr: 'P003', beskrivelse: 'Hosting abonnement', pris: 99.0),
    Product(varnr: 'P004', beskrivelse: 'Supportaftale', pris: 499.0),
    Product(varnr: 'P005', beskrivelse: 'SEO-pakke', pris: 2999.0),
    Product(varnr: 'P006', beskrivelse: 'App-udvikling', pris: 45000.0),
    Product(varnr: 'P007', beskrivelse: 'Logo design', pris: 2500.0),
    Product(varnr: 'P008', beskrivelse: 'Vedligeholdelse', pris: 899.0),
    Product(varnr: 'P009', beskrivelse: 'Workshop (heldag)', pris: 5500.0),
    Product(varnr: 'P010', beskrivelse: 'Rådgivning', pris: 950.0),
  ];
  final List<InvoiceLine> _productLines = <InvoiceLine>[];
  late Customer customer;

  // Renaming: konsekvent og korrekt stavning
  bool isCustomerChosen = false;
  Set<int> _selection = {0}; // Single-select: start med første valgt
double ammount =0;
double vat_ammount = 0;
double total_ammount = 0;
double pay = 0;
  // Extract constant: undgå magiske tal
  static const double _kPagePadding = 16.0;
  static const double _kCardWidth = 370.0;

  // Sikrer at value peger på præcis den instans, der findes i _products
  Product? _selectedFromCatalog(Product? p) {
    if (p == null) return null;
    for (final prod in _products) {
      if (prod.varnr == p.varnr) return prod;
    }
    return null;
  }

  // Extract function: fælles kundekort
  Widget _buildCustomerCard() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: _kCardWidth,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: const Color(0xFFF9F7F4) /* primary-dark-brown-beige-5 */,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFFEEE3D8) /* primary-dark-brown-beige-20 */,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 143,
                  height: 17,
                  child: Text(
                    customer.name,
                    style: const TextStyle(
                      color: Color(
                          0xFF231303) /* primary-dark-brown-dark-brown-200 */,
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
                    style: const TextStyle(
                      color: Color(
                          0xFF392919) /* primary-dark-brown-dark-brown-100 */,
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
                    style: const TextStyle(
                      color: Color(
                          0xFF231303) /* primary-dark-brown-dark-brown-200 */,
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
          const SizedBox(width: 20),
          SizedBox(
            width: 20,
            height: 20,
            child: Stack(),
          ),
        ],
      ),
    );
  }

  // Extract function: fælles leverings-/sendemetode (SegmentedButton)
  Widget _buildDeliveryMethodSelector() {
    Color labelColorFor(int v) =>
        _selection.contains(v) ? Colors.white : Colors.black;
    return SegmentedButton<int>(
      segments: [
        ButtonSegment<int>(
          value: 0,
          label: Text(
            'E-mail',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: labelColorFor(0),
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
              color: labelColorFor(1),
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
              color: labelColorFor(2),
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(length: 2, child:
      Scaffold(
          appBar: AppBar(
            title: const Text('Opret ny indtægt'),
            bottom: const TabBar(
              tabs: [
                SizedBox(
                  width: 160,
                  height: 40,
                  child: Center(child: Text('Faktura')),
                ),
                SizedBox(
                  width: 160,
                  height: 40,
                  child: Center(child: Text('Tilbud')),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              createInvoice(context),
              createOffer(context)
            ],
          )
      ));
  }

  Widget createInvoice(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: _kPagePadding, top: 10),
            alignment: Alignment.topLeft,
            child: const Text("Kunde"),
          ),
          // Change condition: vis valgknap når ingen kunde er valgt
          if(!isCustomerChosen)
            Center(
              child: ElevatedButton(
                onPressed: () {
                  navigateWithSlide(
                      context, CustomerListWidget(addCustomer: addCustomer),
                      SlideDirection.left);
                },
                child: const Text(
                  'Vælg kunde',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(
                        0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                    fontSize: 16,
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w600,
                    height: 1.50,
                  ),
                ),
              ),
            ),
          if(isCustomerChosen) _buildCustomerCard(),
          if(isCustomerChosen)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: _kPagePadding),
              child: _buildDeliveryMethodSelector(),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: _kPagePadding),
            child: Row(
              children: [
                const Text(
                  'Fakturalinjer',
                  style: TextStyle(
                    color: Color(
                        0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                    fontSize: 16,
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Vis uden moms',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(
                        0xFF0354F0) /* primary-fresh-blue-fresh-blue-100 */,
                    fontSize: 14,
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w600,
                    height: 1.71,
                  ),
                ),
              ],
            ),
          ),
          // Move/Replace layout: fjern Expanded i scroll-view
          ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _productLines.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final InvoiceLine c = _productLines[index];
              return ListTile(
                onTap: () {
                  setState(() {});
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                title: Container(
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 310,
                                    child: Text(
                                      'Produkt',
                                      style: TextStyle(
                                        color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                        fontSize: 14,
                                        fontFamily: 'Figtree',
                                        fontWeight: FontWeight.w400,
                                        height: 1.71,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 310,
                                    child: Text(
                                      '${c.product}',
                                      style: TextStyle(
                                        color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                        fontSize: 16,
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
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 338,
                            child: Text(
                              'Beskrivelse',
                              style: TextStyle(
                                color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                fontSize: 14,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400,
                                height: 1.71,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 338,
                            child: Text(
                              '${c.beskrivelse}',
                              style: TextStyle(
                                color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                fontSize: 16,
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Antal',
                                    style: TextStyle(
                                      color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                      fontSize: 14,
                                      fontFamily: 'Figtree',
                                      fontWeight: FontWeight.w400,
                                      height: 1.71,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 161,
                                    child: Text(
                                      '${c.antal}',
                                      style: TextStyle(
                                        color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                        fontSize: 16,
                                        fontFamily: 'Figtree',
                                        fontWeight: FontWeight.w400,
                                        height: 1.50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Enhedspris',
                                    style: TextStyle(
                                      color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                      fontSize: 14,
                                      fontFamily: 'Figtree',
                                      fontWeight: FontWeight.w400,
                                      height: 1.71,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 161,
                                    child: Text(
                                      '${c.pris} kr',
                                      style: TextStyle(
                                        color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                        fontSize: 16,
                                        fontFamily: 'Figtree',
                                        fontWeight: FontWeight.w400,
                                        height: 1.50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEEE3D8) /* primary-dark-brown-beige-20 */,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 16,
                          children: [
                            SizedBox(
                              width: 302,
                              height: 17,
                              child: Text(
                                'I alt ${c.ialt} kr.',
                                style: TextStyle(
                                  color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                  fontSize: 16,
                                  fontFamily: 'Figtree',
                                  fontWeight: FontWeight.w600,
                                  height: 1.50,
                                ),
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
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0xFFE0E0E0)),
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            },
          ),
          if(isCustomerChosen)
            Center(
              child: ElevatedButton(
                onPressed: () {
                  addVarelinje();
                },
                child: const Text("Tilføj varelinje"),
              ),
            ),
          const Divider(),
          Container(

            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: const Color(0xFFF3F7FF) /* primary-fresh-blue-fresh-blue-5 */,
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16,
              children: [
                Container(
                  width: 370,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 4,
                          children: [
                            SizedBox(
                              width: 183,
                              child: Text(
                                'Beløb',
                                style: TextStyle(
                                  color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                  fontSize: 16,
                                  fontFamily: 'Figtree',
                                  fontWeight: FontWeight.w400,
                                  height: 1.50,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 183,
                              child: Text(
                                '${ammount}',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                  fontSize: 16,
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
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 4,
                          children: [
                            SizedBox(
                              width: 183,
                              child: Text(
                                'Moms',
                                style: TextStyle(
                                  color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                  fontSize: 16,
                                  fontFamily: 'Figtree',
                                  fontWeight: FontWeight.w400,
                                  height: 1.50,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 183,
                              child: Text(
                                '${vat_ammount}',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                                  fontSize: 16,
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
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8,
                          children: [
                            SizedBox(
                              width: 181,
                              child: Text(
                                'Total',
                                style: TextStyle(
                                  color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                  fontSize: 16,
                                  fontFamily: 'Figtree',
                                  fontWeight: FontWeight.w600,
                                  height: 1.50,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 181,
                              child: Text(
                                '${total_ammount}',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                  fontSize: 16,
                                  fontFamily: 'Figtree',
                                  fontWeight: FontWeight.w600,
                                  height: 1.50,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      if(isCustomerChosen)
                      Container(
alignment: Alignment.center,
                        child:   CircleSlideToActionButton(
                          //slideToActionController: controller2,
                          width: 250,
                          parentBoxRadiusValue: 27,
                          circleSlidingButtonSize: 47,
                          leftEdgeSpacing: 3,
                          rightEdgeSpacing: 3,
                          initialSlidingActionLabel: 'Send',
                          finalSlidingActionLabel: 'Er sendt',
                          circleSlidingButtonIcon: const Icon(
                            Icons.add_shopping_cart,
                            color: Colors.blue,
                          ),
                          parentBoxBackgroundColor: Colors.blue,
                          parentBoxDisableBackgroundColor: Colors.grey,
                          /*  parentBoxGradientBackgroundColor:
                    LinearGradient(colors: [Colors.red, Colors.white]),
                parentBoxDisableGradientBackgroundColor:
                    LinearGradient(colors: [Colors.red, Colors.white]),*/
                          circleSlidingButtonBackgroundColor: Colors.white,
                          isEnable: true,
                          onSlideActionCompleted: () {
                            print("Sliding action completed");
                          },
                          onSlideActionCanceled: () {
                            print("Sliding action cancelled");
                          },
                        ),
                      )
                    ],
                  ),
                ),



                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  height: 26,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 257,
                        top: 18,
                        child: Container(
                          transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
                          width: 144,
                          height: 5,
                          decoration: ShapeDecoration(
                            color: Colors.black /* Labels-Primary */,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget createOffer(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: _kPagePadding, top: 10),
            alignment: Alignment.topLeft,
            child: const Text("Kunde"),
          ),
          if(!isCustomerChosen)
            Center(
              child: ElevatedButton(
                onPressed: () {
                  navigateWithSlide(
                      context, CustomerListWidget(addCustomer: addCustomer),
                      SlideDirection.left);
                },
                child: const Text(
                  'Vælg kunde',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(
                        0xFF392919) /* primary-dark-brown-dark-brown-100 */,
                    fontSize: 16,
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w600,
                    height: 1.50,
                  ),
                ),
              ),
            ),
          if(isCustomerChosen) _buildCustomerCard(),
          if(isCustomerChosen)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: _kPagePadding),
              child: _buildDeliveryMethodSelector(),
            ),
          const Divider(),
        ],
      ),
    );
  }

  addCustomer(Customer value) {
    setState(() {
      customer = value;
      isCustomerChosen = true;
    });
  }

  Future<void> addVarelinje() async {
    final TextEditingController beskrivelse = TextEditingController();
    final TextEditingController antal = TextEditingController();
    final TextEditingController pris = TextEditingController();
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        final bottomInset = MediaQuery
            .of(context)
            .viewInsets
            .bottom;
        return Padding(
          padding: EdgeInsets.only(bottom: bottomInset),
          child: FractionallySizedBox(
            heightFactor: 0.5,
            child: SafeArea(
              top: false,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButtonFormField<Product>(
                        value: _selectedFromCatalog(_selectedProduct),
                        isExpanded: true,
                        items: _products
                            .map(
                              (p) =>
                              DropdownMenuItem<Product>(
                                value: p,
                                child: Text(p.beskrivelse),
                              ),
                        )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedProduct = value ?? Product(
                                varnr: '', beskrivelse: 'beskrivelse', pris: 0);
                            // Opdater tekstfelter direkte
                            beskrivelse.text =
                                _selectedProduct?.beskrivelse ?? '';
                            pris.text =
                                (_selectedProduct?.pris ?? 0).toString();
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          labelText: 'Vælg produkt',
                        ),
                      ),
                      Column(
                        children: [
                          Customwidgets.buildLabel('Beskrivelse',
                              margin: const EdgeInsets.only(
                                  left: 16, right: 16)),
                          SizedBox(
                            width: double.infinity,
                            child: Customwidgets.textField(beskrivelse),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Customwidgets.buildLabel('Antal'),
                                SizedBox(
                                  width: double.infinity,
                                  child: Customwidgets.textField(antal),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              children: [
                                Customwidgets.buildLabel('Pris'),
                                SizedBox(
                                  width: double.infinity,
                                  child: Customwidgets.textField(pris),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final int parsedAntal = int.tryParse(
                              antal.text.trim()) ?? 1;
                          final double parsedPris = double.tryParse(
                              pris.text.trim()) ??
                              (_selectedProduct?.pris ?? 0);
                          final String desc = beskrivelse.text.isNotEmpty
                              ? beskrivelse.text
                              : (_selectedProduct?.beskrivelse ?? '');
                          final double ialt = parsedAntal * parsedPris;
                          final InvoiceLine v = InvoiceLine(
                            product: _selectedProduct?.beskrivelse ?? '',
                            beskrivelse: desc,
                            pris: parsedPris,
                            antal: parsedAntal,
                            ialt: ialt
                          );
                          setState(() {
                            _productLines.add(v);

                            calculateSum();
                            // Bugfix: må ikke ændre kundevalg ved tilføjelse af varelinje
                          });
                        },
                        child: const Text('Tilføj'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  
  Future<void> calculateSum() {
    final double subtotal = _productLines.fold<double>(
      0.0,
      (sum, line) => sum + line.ialt,
    );

    setState(() {
      ammount = subtotal;
      vat_ammount = subtotal * 0.25; // 25% moms – justér efter behov
      total_ammount = ammount + vat_ammount;

      // Sørg for at 'pay' ikke overstiger totalen eller bliver NaN
      if (total_ammount <= 0) {
        pay = 0;
      } else if (pay > total_ammount) {
        pay = total_ammount;
      } else if (pay < 0) {
        pay = 0;
      }
    });

    return Future.value();
  }
}
