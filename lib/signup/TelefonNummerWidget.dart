import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:appelsin/pincode/PinCodeSetupWidget.dart';
import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
class Telefonnummerwidget extends StatefulWidget {
  final String phone;
final Appelsinbruger appelsinbruger;
  const Telefonnummerwidget({Key? key , required this.phone, required this.appelsinbruger}): super(key: key);
  @override
    State<StatefulWidget> createState() => _Telefonnummerwidget();
}

class _Telefonnummerwidget extends State<Telefonnummerwidget> {
  
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar:  AppBar(
          title: Text("Verificre dit telefon nummr"),
        ),
        body: SafeArea(child: Container(
    child: Column(
      children: [
        Container(
          child: Customwidgets.step(0.3, "4", "9"),
        ),
        Container(
          child: Image.asset('assets/images/3x/appelsin_pos_thumbsup@3x.png'),
        ),
      Container(child: Text("Vi skal have dit telefon nummer valideret \n Du vil modtage en sms med et link ",style:  TextStyle(fontFamily: 'Sora'),)),

        Spacer(),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: ElevatedButton(
style: ElevatedButton.styleFrom(
  fixedSize: Size(MediaQuery.of(context).size.width, 23)
),
              onPressed: (){

navigateWithSlide(context, PinCodeSetupWidget(appelsinbruger: widget.appelsinbruger), SlideDirection.left);
              }, child: Text("Videre")),
        )
    ],
    ),
    )));
    }
}