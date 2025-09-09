import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/pincode/PinCodeVerifyWidget.dart';
import 'package:appelsin/pincode/SavePinCodeWidget.dart';
import 'package:appelsin/signup/AllowNotificationWidget.dart';
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
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 16, right: 16, top :90),
              child: Image.asset("assets/images/3x/appelsin_pos_tlf@3x.png"),
            ),
            Container(
              child: Text("Vil du benytte Face ID til at logge ind i Appelsin?", style: TextStyle(fontFamily: 'FigTree', fontSize: 16),),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: ElevatedButton(onPressed: (){
                navigateWithSlide(context, AllowNotificationWidget(), SlideDirection.right);
              }, child: Text("Ja Benyt face id"),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 22)
              )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),

              child: ElevatedButton(onPressed: (){}, child: Text("Spring over"),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 22),
                backgroundColor: Colors.orangeAccent.shade100
              ),
              ),
            )
          ],
        ),
      )),
    );
  }
}