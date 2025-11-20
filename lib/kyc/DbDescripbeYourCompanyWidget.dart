import 'dart:convert';

import 'package:appelsin/apis/AppelsinKycApi.dart';
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:appelsin/models/Kyc.dart';
import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/kyc/CompanyDetalisWidget.dart';
class DbDescripbeYourCompanyWidget extends StatefulWidget {
final Appelsinbruger appelsinbruger;
  const DbDescripbeYourCompanyWidget({Key? key, required this.appelsinbruger}) : super(key: key);

  @override
  _DbDescripbeYourCompanyWidget createState() => _DbDescripbeYourCompanyWidget();

}

class _DbDescripbeYourCompanyWidget extends State<DbDescripbeYourCompanyWidget> {
  TextEditingController textEditingController = TextEditingController();
  late Appelsinkycapi _appelsinkycapi;
  
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appelsinkycapi = Appelsinkycapi();
  }
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text("Beskriv kort dit firma"),
  ),
  body: SafeArea(child: Container(margin: 
    EdgeInsets.only(left: 16, right:  16), 
    child: Column(
      children: [
        Container(
          child:Customwidgets.step(0.3, "8", "10") ,
        ),
        TextField(
          controller: textEditingController,
          minLines: 2,
          maxLines: 2,
        ),
        Spacer(),
        Container(
          child: ElevatedButton(onPressed: ()  {
addKyc();
            navigateWithSlide(context, CompanyDetailsWidget(appelsinbruger: widget.appelsinbruger,), SlideDirection.left);
          }, child: Text("Videre"),
              style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width, 48),
  )
          ),
        )
      ],
    ),
    )),
);
  
  }
  
  Future<void> addKyc() async {
    var json = jsonEncode(  textEditingController.value.text);
    Kyc kyc = Kyc(appelsinBrugerId: widget.appelsinbruger.id!, linje:  json, isDone: true, step: 'Beskriv firmma');
   await _appelsinkycapi.createKyc(kyc, widget.appelsinbruger.id!);
  }
}