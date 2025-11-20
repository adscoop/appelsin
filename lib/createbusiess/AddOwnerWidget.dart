import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:flutter/cupertino.dart';
import 'package:riff_switch/riff_switch.dart';
import  'package:appelsin/models/OwnerDTO.dart';

class AddOwnerWidget extends StatefulWidget {
  final Function(OwnerDTO) call;
  // Optional parameters for edit mode
  final OwnerDTO? initialOwner;
  final int? ownerIndex;
  final Function(int, OwnerDTO)? onUpdate;

  const AddOwnerWidget({
    Key? key,
    required this.call,
    this.initialOwner,
    this.ownerIndex,
    this.onUpdate,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AddOwnerWidget();
}

class _AddOwnerWidget extends State<AddOwnerWidget> {
  bool _modtag = false;
  bool _erDUPep=false;
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

  bool get isEdit => widget.initialOwner != null;

  @override
  void initState() {
    super.initState();
    // Prefill fields if editing an existing owner
    final init = widget.initialOwner;
    if (init != null) {
      fornavn.text = init.fornavn;
      efternavn.text = init.efternavn;
      ejerprocent.text = init.ejerandel.toString();
      telefon.text = init.telefonnummer;
      rolle.text = init.rolle;
      cpr.text = (init.cpr ?? '').toString();
      addresse.text = init.vejnavn_nummer ?? '';
      city.text = init.city ?? '';
      zipCode.text = init.postnummer ?? '';
      // Normalize any legacy/english values (e.g., "Danish") to match dropdown items (e.g., "Danmark")
      selectedResident = _normalizeCountryLabel(init.statsborgerskab);
      selectedSkattepligt = _normalizeCountryLabel(init.skattepligt);
      _modtag = init.erKontaktPerson;
      _erDUPep = init.erDuPep;
    }
  }


  final List<String> SkattePligt = [
    "Vælg land",
    "Danmark",
    "Sverige",
    "Norge",
    "Finland",
    "Tyskland",
    "Frankrig",
    "Spanien",
    "Italien",
    "Storbritannien",
    "Irland",
    "Nederlandene",
    "Belgien",
    "Schweiz",
    "Østrig",
    "Polen",
    "Tjekkiet",
    "Estland",
    "Letland",
    "Litauen",
    "Island",
    "Færøerne",
    "Grønland",
    "Portugal",
    "Grækenland",
    "Tyrkiet",
    "USA",
    "Canada",
    "Mexico",
    "Brasilien",
    "Argentina",
    "Chile",
    "Australien",
    "New Zealand",
    "Japan",
    "Kina",
    "Hongkong",
    "Singapore",
    "Indien",
    "Thailand",
    "Vietnam",
    "Indonesien",
    "Filippinerne",
    "Sydkorea",
    "Sydafrika",
    "Egypten",
    "Forenede Arabiske Emirater",
    "Saudi-Arabien",
    "Qatar"
  ];

  final List<String> Resisnt = [
    // Fjern placeholder fra selve listen – hint bruges i stedet
    "Vælg land",
    "Danmark",
    "Sverige",
    "Norge",
    "Finland",
    "Tyskland",
    "Frankrig",
    "Spanien",
    "Italien",
    "Storbritannien",
    "Irland",
    "Nederlandene",
    "Belgien",
    "Schweiz",
    "Østrig",
    "Polen",
    "Tjekkiet",
    "Estland",
    "Letland",
    "Litauen",
    "Island",
    "Færøerne",
    "Grønland",
    "Portugal",
    "Grækenland",
    "Tyrkiet",
    "USA",
    "Canada",
    "Mexico",
    "Brasilien",
    "Argentina",
    "Chile",
    "Australien",
    "New Zealand",
    "Japan",
    "Kina",
    "Hongkong",
    "Singapore",
    "Indien",
    "Thailand",
    "Vietnam",
    "Indonesien",
    "Filippinerne",
    "Sydkorea",
    "Sydafrika",
    "Egypten",
    "Forenede Arabiske Emirater",
    "Saudi-Arabien",
    "Qatar"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        isEdit ? 'Rediger ejer' : 'Tilføj ejer',
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
          Customwidgets.textField(cpr),

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
              // Basal validering og sikker parsing for at undgå null/format-fejl
              final String firstName = fornavn.value.text;
              final String lastName = efternavn.value.text;
              final String ejerandelText = ejerprocent.text;
              final double? ejerandelVal = double.tryParse(ejerandelText);

              if (selectedResident == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Vælg statsborgerskab')),
                );
                return;
              }
              if (selectedSkattepligt == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Vælg skattepligt')),
                );
                return;
              }
              if (ejerandelVal == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Indtast en gyldig ejerandel (tal)')),
                );
                return;
              }

              final res = OwnerDTO(
                fornavn: firstName,
                efternavn: lastName,
                ejerandel: ejerandelVal,
                telefonnummer: telefon.text.trim(),
                rolle: rolle.text.trim(),
                cpr: cpr.text.trim(),
                statsborgerskab: selectedResident!,
                skattepligt: selectedSkattepligt!,
                vejnavn_nummer: addresse.text.trim(),
                city: city.text.trim(),
                postnummer: zipCode.text.trim(),
                erKontaktPerson: _modtag,
                erDuPep: _erDUPep,
                erAndrePep: _erDUPep,
              );
              if (isEdit && widget.onUpdate != null && widget.ownerIndex != null) {
                widget.onUpdate!(widget.ownerIndex!, res);
              } else {
                widget.call(res);
              }
            }, child: Text(isEdit ? "Gem ændringer" : "Tilføj ejer "),
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

  // --- Helpers ---
  // Convert possible English or code values to the Danish label used in the dropdown lists
  String? _normalizeCountryLabel(String? input) {
    if (input == null) return null;
    final v = input.trim();
    if (v.isEmpty) return null;
    // Common quick mappings
    const Map<String, String> quick = {
      'Danish': 'Danmark',
      'Denmark': 'Danmark',
      'Sweden': 'Sverige',
      'Norway': 'Norge',
      'Finland': 'Finland',
      'Germany': 'Tyskland',
      'France': 'Frankrig',
      'Spain': 'Spanien',
      'Italy': 'Italien',
      'United Kingdom': 'Storbritannien',
      'UK': 'Storbritannien',
      'Ireland': 'Irland',
      'Netherlands': 'Nederlandene',
      'Belgium': 'Belgien',
      'Switzerland': 'Schweiz',
      'Austria': 'Østrig',
      'Poland': 'Polen',
      'Czech Republic': 'Tjekkiet',
      'Estonia': 'Estland',
      'Latvia': 'Letland',
      'Lithuania': 'Litauen',
      'Iceland': 'Island',
      'Faroe Islands': 'Færøerne',
      'Greenland': 'Grønland',
      'Portugal': 'Portugal',
      'Greece': 'Grækenland',
      'Turkey': 'Tyrkiet',
      'United States': 'USA',
      'USA': 'USA',
      'Canada': 'Canada',
      'Mexico': 'Mexico',
      'Brazil': 'Brasilien',
      'Argentina': 'Argentina',
      'Chile': 'Chile',
      'Australia': 'Australien',
      'New Zealand': 'New Zealand',
      'Japan': 'Japan',
      'China': 'Kina',
      'Hong Kong': 'Hongkong',
      'Singapore': 'Singapore',
      'India': 'Indien',
      'Thailand': 'Thailand',
      'Vietnam': 'Vietnam',
      'Indonesia': 'Indonesien',
      'Philippines': 'Filippinerne',
      'South Korea': 'Sydkorea',
      'South Africa': 'Sydafrika',
      'Egypt': 'Egypten',
      'United Arab Emirates': 'Forenede Arabiske Emirater',
      'Saudi Arabia': 'Saudi-Arabien',
      'Qatar': 'Qatar',
    };
    // If already one of the items, return as is
    if (Resisnt.contains(v)) return v;
    // Try quick map first
    if (quick.containsKey(v)) return quick[v];
    // Try case-insensitive match by label
    final match = Resisnt.firstWhere(
      (e) => e.toLowerCase() == v.toLowerCase(),
      orElse: () => '',
    );
    if (match.isNotEmpty) return match;
    // Not recognized → leave null to avoid Dropdown assertion
    return null;
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