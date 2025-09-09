import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:flutter/cupertino.dart';
import 'package:riff_switch/riff_switch.dart';
import  'package:appelsin/models/OwnerDTO.dart';

class AddOwnerWidget extends StatefulWidget {
 final  Function(OwnerDTO) call;

 const AddOwnerWidget({Key? key , required this.call});
  @override
  State<StatefulWidget> createState() => _AddOwnerWidget();
}

class _AddOwnerWidget extends State<AddOwnerWidget> {
  bool _modtag = false;
  bool _erDUPep=false;
  String selecteSkattePligt ="";
  String? selectedResident; // start som null så value matcher betingelsen
  String? selectedSkattepligt; // separat state til skattepligt-dropdown
  TextEditingController fornavn = TextEditingController();
  TextEditingController efternavn = TextEditingController();
  TextEditingController ejerprocent  = TextEditingController();
  TextEditingController telefon = TextEditingController();
  TextEditingController rolle = TextEditingController();
  TextEditingController cpr = TextEditingController();
  TextEditingController addresse = TextEditingController();
  TextEditingController stateborgerskab = TextEditingController();
  TextEditingController skattepligt = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController zipCode = TextEditingController();


  final List<String> SkattePligt = [
    "Vælg beskæftigelse",
    "Håndværker og Service",
    "Butik og detailhandel",
    "Webshop og e-handel",
    "Kreativ og freelance",
    "Sundhed",
    "Bogholder",
    "Startup",
    "Ejendomme",
    "Andet"
  ];

  final List<String> Resisnt = [
    // Fjern placeholder fra selve listen – hint bruges i stedet
    "Håndværker og Service",
    "Butik og detailhandel",
    "Webshop og e-handel",
    "Kreativ og freelance",
    "Sundhed",
    "Bogholder",
    "Startup",
    "Ejendomme",
    "Andet"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'Tilføj ejer',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
          fontSize: 20,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w400,
        ),
      ),),
      body: SingleChildScrollView(child: Container(
        margin: EdgeInsets.only(left: 16, right:  16),
        child: Column(children: [
          Customwidgets.buildLabel('Fornavn',margin: EdgeInsets.only(left: 16 , right: 16)),
          Customwidgets.textField(fornavn),
          Customwidgets.buildLabel('Efternavn',margin: EdgeInsets.only(left: 16 , right: 16)),
          Customwidgets.textField(efternavn),
          Customwidgets.buildLabel('Ejerandel i procent',margin: EdgeInsets.only(left: 16 , right: 16)),
          Customwidgets.textField(ejerprocent, suffix: Text("%")),
          Customwidgets.buildLabel('teleonnummer',margin: EdgeInsets.only(left: 16 , right: 16)),
          Customwidgets.textField(telefon),
          Customwidgets.buildLabel('Rolle',margin: EdgeInsets.only(left: 16 , right: 16)),
          Customwidgets.textField(rolle),
          Customwidgets.buildLabel('CPR-nummer',margin: EdgeInsets.only(left: 16 , right: 16)),
          Customwidgets.textField(cpr, prefixText: "YYMMDD-XXXX"),

_rowWidgetPerson(),

          Divider(),
         Customwidgets.buildLabel('Vejnavn og nummer',margin: EdgeInsets.only(left: 16 , right: 16)),
         Customwidgets.textField(addresse),
_rowWidget(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: _boxDecoration(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        "Er Personen kontaktperson?",
                        style: TextStyle(fontFamily: 'FigTree'),
                      ),
                    ),
                    RiffSwitch(
                      width: 70,
                      type: RiffSwitchType.simple,
                      value: _modtag,
                      onChanged: (bool newValue) {
                        setState(() {
                          _modtag = newValue;
                        });
                      },
                      inactiveTrackColor: Colors.white,
                      activeTrackColor: Colors.white,
                      activeColor: Colors.blue,
                      activeText: const Text("JA",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Figtree',
                            fontWeight: FontWeight.w500,
                          )),
                      inactiveText: const Text("NEJ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Figtree',
                            fontWeight: FontWeight.w500,
                          )),
                      inactiveThumbColor: Colors.black,
                    )
                  ],
                ),

              ],
            ),
          ),
          Container(
            width: 370,
            height: 257,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16,
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: 242,
                        child: Text(
                          'Er du / en eller flere i din familie eller nærmestående samarbejdspartnere omfattet af definitionen for politisk eksponerede personer (PEP)?',
                          style: TextStyle(
                            color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                            fontSize: 14,
                            fontFamily: 'Figtree',
                            fontWeight: FontWeight.w400,
                            height: 1.71,
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: const Color(0xFFE8D8CA),
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Container(
                              width: 42,
                              height: 34,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Text(
                                    'Nej',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Figtree',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
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
                    color: const Color(0xFFFFEFD7) /* primary-juicy-orange-juicy-orange-10 */,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: 242,
                        child: Text(
                          'Er en eller flere i din familie eller nærmestående samarbejdspartnere omfattet af definitionen for politisk eksponerede personer (PEP)?',
                          style: TextStyle(
                            color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
                            fontSize: 14,
                            fontFamily: 'Figtree',
                            fontWeight: FontWeight.w400,
                            height: 1.71,
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: const Color(0xFFE8D8CA),
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child:  RiffSwitch(
                          width: 70,
                          type: RiffSwitchType.simple,
                          value: _erDUPep,
                          onChanged: (bool newValue) {
                            setState(() {
                              _erDUPep = newValue;
                            });
                          },
                          inactiveTrackColor: Colors.white,
                          activeTrackColor: Colors.white,
                          activeColor: Colors.blue,
                          activeText: const Text("Ja",
                              style: TextStyle(color: Colors.white)),
                          inactiveText: const Text("Nej",
                              style: TextStyle(color: Colors.white)),
                          inactiveThumbColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

          Divider(),
          Container(
margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
            child: ElevatedButton(onPressed: () {
             var res = OwnerDTO(fornavn: 'fornavn', efternavn: 'efternavn', ejerandel: 2, telefonnummer: 'telefonnummer', rolle: 'rolle', cpr: 'cpr', statsborgerskab: 'statsborgerskab', skattepligt: 'skattepligt', vejnavn_nummer: 'vejnavn_nummer', city: 'city', postnummer: 'postnummer', erKontaktPerson: true, erDuPep: false, erAndrePep: false);
widget.call(res!);
            }, child: Text("Tilføj ejer "),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width, 22)
            ),
            ),
          )
        ],),
        
      )),
    );
  }
  
  @override
  void dispose() {
    fornavn.dispose();
    efternavn.dispose();
    ejerprocent.dispose();
    telefon.dispose();
    rolle.dispose();
    cpr.dispose();
    addresse.dispose();
    stateborgerskab.dispose();
    skattepligt.dispose();
    city.dispose();
    zipCode.dispose();
    super.dispose();
  }

  Widget _rowWidgetPerson() {
    return
      Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child:
      Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 173,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Customwidgets.buildLabel('Stateborger'),
              DropdownButtonFormField<String>(
                value: selectedResident, // null indtil brugeren vælger noget
                isExpanded: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outlineVariant,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
                hint: const Text("Vælg "),
                items: Resisnt
                    .map((title) => DropdownMenuItem<String>(
                          value: title,
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: const Color(0xFF392919),
                              fontSize: 12,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectedResident = val; // undgå val! – lad den være nullbar
                  });
                },
                validator: (val) => val == null ? "Vælg en beboer" : null,
              )
            ],
          ),
        ),
        SizedBox(width: 30),
        SizedBox(
          width: 173 ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Customwidgets.buildLabel('Skattepligt'),

              DropdownButtonFormField<String>(

                value: selectedSkattepligt,
                isExpanded: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outlineVariant,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
                hint: const Text("Vælg "),
                items: SkattePligt
                    .map((title) => DropdownMenuItem<String>(
                          value: title,
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: const Color(0xFF392919),
                              fontSize: 12,
                              fontFamily: 'Figtree',
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectedSkattepligt = val;
                  });
                },
                validator: (val) => val == null ? "Vælg skattepligt" : null,
              )
            ],
          ),
        ),
      ],
    ));
  }
  Widget _rowWidget(
      ) {
    return Row(
      children: [
        Expanded(child:
        Column(
          children: [
            Customwidgets.buildLabel('By',margin: EdgeInsets.only(left: 16 , right: 16)),
            Customwidgets.textField(city)

          ],
        )),
        Expanded(child:
        Column(
          children: [
            Customwidgets.buildLabel('Postnummer',margin: EdgeInsets.only(left: 16 , right: 16)),
            Customwidgets.textField(zipCode)
          ],
        ))
      ],
    );
  }

  ShapeDecoration _boxDecoration() {
    return ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 1,
          color: Color(0xFFEEE3D8),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}