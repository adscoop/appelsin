import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:flutter/material.dart';

class Approverecipiewidget  extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => _Approverecipiewidget();
    
  
}

class _Approverecipiewidget extends State<Approverecipiewidget> {

  TextEditingController _amount = TextEditingController();
  TextEditingController _commen = TextEditingController();
  @override
    Widget build(BuildContext context) {
      return Scaffold(appBar: AppBar(
        title: const Text(
          'Opret ny regning',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF231303), // primary-dark-brown-dark-brown-200
            fontSize: 20,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
        body: SingleChildScrollView(
           child: Column(children: [
            Customwidgets.buildLabel("Beløb"),
             Customwidgets.textField(_amount),
             Customwidgets.buildLabel("Kommenter"),
             Customwidgets.textField(_commen)
           ])
        ),
      );
    }
}