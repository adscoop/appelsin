import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/pincode/PinCodeVerifyWidget.dart';
import 'package:appelsin/pincode/SavePinCodeWidget.dart';
class EasyLoginWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _EasyLoginWidget();

}

class _EasyLoginWidget extends State<EasyLoginWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nemmere log in'),
      ),
      body: SafeArea(child: Container(
        child: Column(
          children: [
          Container(
            alignment: Alignment.center,
            child: Customwidgets.step(0.7, "3", "10"),
          ),

            Container(
              
              child: Image.asset("assets/images/3x/appelsin_pos_tlf@3x.png"),
            ),
            Spacer(),
            Container(
              child: ElevatedButton(onPressed: (){}, child: Text("Videre")),
            ),
            Container(
              child: ElevatedButton(onPressed: (){}, child: Text("Spring over")),
            )
          ],
        ),
      )),
    );
  }
}