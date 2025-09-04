
import 'package:appelsin/apis/AppelsinApi.dart';
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:appelsin/signup/CheckEmailWidget.dart';
import 'package:appelsin/signup/SendSmsValidateWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/pincode/PinCodeSetupWidget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
class Namewidget   extends StatefulWidget
{
 @override
   State<StatefulWidget> createState()  => _Namewidget();
}

class _Namewidget extends State<Namewidget> {
    String choosenTitle = "Valg";
    String selectedTitle = "Vælg beskæftigelse"; // initial value

    final List<String> workTitles = [
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
    ];  final TextEditingController fornavm = TextEditingController();
  final TextEditingController efternavn = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController telefon = TextEditingController();
  late Appelsinapi _appelsinApi;


  @override
  void initState() {
    super.initState();
    _appelsinApi = Appelsinapi();
  }

  @override
  void dispose() {
    // rydder op efter controllere
    fornavm.dispose();
    efternavn.dispose();
    email.dispose();
    telefon.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kontakt oplysninger"),
      ),
      body: SingleChildScrollView(
        child: form(),
      ),
    );
  }

  Widget form() {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Customwidgets.label("Fornavn")),
        Container(child: Customwidgets.textField(fornavm)),
        Container(
            margin: EdgeInsets.only(left: 16, right: 16),

            child: Customwidgets.label("Efternavn")),
        Customwidgets.textField(efternavn),
        Container(
            margin: EdgeInsets.only(left: 16, right: 16),

            child: Customwidgets.label("E-mail")),
        Customwidgets.textField(email),
        Container(
            margin: EdgeInsets.only(left: 16, right: 16),

            child: Customwidgets.label("Telefonnummer")),
        Customwidgets.textField(telefon, prefixText: '+45'),
       Container(child: Text("Vi sender en SMS til dit telefonnummer for at verificere \n det når du trykker “Videre” .")),
          Container(
       margin: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
    child: DropdownButtonFormField<String>(

    value: selectedTitle,
    isExpanded: true, // så teksten ikke bliver cuttet
    decoration: InputDecoration(

    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(color: CupertinoDynamicColor.withBrightness(color: Colors.blue.shade900, darkColor: Colors.orangeAccent), width: 0.1
        )),
    ),
    items: workTitles.map((title) {
    return DropdownMenuItem<String>(
      alignment: Alignment.topLeft,
    value: title,
    child:  Container(

      margin: EdgeInsets.only(left: 16, right: 16),
      child:Text(title) ,
    ),
    );
    }).toList(),
    onChanged: (val) {
    setState(() {
    selectedTitle = val!;
    });
    },
    ),
    ),

Container(
  margin: EdgeInsets.only(left: 16, right: 16),
  child: ElevatedButton(onPressed: (){
    opret();
  }, child: Text("Videre"), style: ElevatedButton.styleFrom(
    fixedSize: Size(MediaQuery.of(context).size.width, 22)
  ),),
)
      ],
    );
  }

  Future<void> opret() async {
    final bruger = Appelsinbruger(
      FirstName: fornavm.text,
      LastName: efternavn.text,
      PhoneNumber: telefon.text,
      Email: email.text,
      stilling: selectedTitle
    );

    final res = await _appelsinApi.opretAppelsinBruger(bruger);
navigateWithSlide(context, PinCodeSetupWidget(), SlideDirection.left);
  }
}

