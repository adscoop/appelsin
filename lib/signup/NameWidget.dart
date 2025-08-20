
import 'package:appelsin/signup/CheckEmailWidget.dart';
import 'package:appelsin/signup/EmailWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
class Namewidget   extends StatefulWidget
{
 @override
   State<StatefulWidget> createState()  => _Namewidget();
}

class _Namewidget extends State<Namewidget> {
  TextEditingController fornavm = TextEditingController();
  TextEditingController efternavn = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telefon = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Kontakt oplysninger"),
      ),
      body: SafeArea(child: Container(
        child: form()
          ),

      ),
    );
    }

 Widget form(){
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Column(
        children: [
          Customwidgets.label("Fornavn"),
          Customwidgets.textField(fornavm),
          Customwidgets.label("Efternavn"),
          Customwidgets. textField(efternavn),
          Customwidgets.label("E-mail"),
          Customwidgets. textField(email),
          Customwidgets.label("Telefonnummer"),
          Customwidgets. textField(telefon),
          Spacer(),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 22)
              ),
                onPressed: () {
            navigateWithSlide(context, Checkemailwidget(),SlideDirection.down);

            }, child: Text("Videre")),
          )
        ],
      ),
    );
 }


}
