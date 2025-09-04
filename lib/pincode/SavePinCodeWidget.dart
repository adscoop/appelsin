import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/signup/EasyLoginWidget.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
class SavePinCodeWidget extends StatefulWidget{
@override
  State<StatefulWidget> createState() => _SavePinCodeWidget();
}

class _SavePinCodeWidget extends State<SavePinCodeWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PIN Kode", style: TextStyle(fontFamily: 'Sora')),
      ),
      body: SafeArea(child: Container(
        
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Customwidgets.step(0.6, "6", "10"),
            Container(
              margin: EdgeInsets.only(left: 16,right: 16, top: 190),
              child: Image.asset("assets/images/3x/pos_laas_aaben@3x.png"),
            ),
            Container(
              child: Text("Din PIN kode er gemt. \n Du kan altid ændre din i app’en under indstillinger.", textAlign: TextAlign.center,),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(left: 16, right:  16),
              child: ElevatedButton(onPressed: (){
                navigateWithSlide(context, EasyLoginWidget(), SlideDirection.right);
              }, child: Text("Videre"),
              style:  ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 22)
              )
              ),
            )
          ],
        ),
      )),
    );
  }
}