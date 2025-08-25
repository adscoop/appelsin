
import 'package:appelsin/apis/AppelsinApi.dart';
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:appelsin/signup/CheckEmailWidget.dart';
import 'package:appelsin/signup/EmailWidget.dart';
import 'package:appelsin/signup/SendSmsValidateWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
class Namewidget   extends StatefulWidget
{
 @override
   State<StatefulWidget> createState()  => _Namewidget();
}

class _Namewidget extends State<Namewidget> {
  final TextEditingController fornavm = TextEditingController();
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
        const SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width, 22),
            ),
            onPressed: opret,
            child: const Text("Videre"),
          ),
        ),
      ],
    );
  }

  Future<void> opret() async {
    final bruger = Appelsinbruger(
      FirstName: fornavm.text,
      LastName: efternavn.text,
      PhoneNumber: telefon.text,
      Email: email.text,
    );

    final res = await _appelsinApi.opretAppelsinBruger(bruger);
    // her kunne du evt. tjekke res.statusCode eller give feedback
  }
}

