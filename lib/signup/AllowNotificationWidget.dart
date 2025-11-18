
import 'package:appelsin/apis/AppelsinApi.dart';
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';

import 'package:appelsin/signup/AlmostDoneCreeateCompanyRampWidget.dart';

class AllowNotificationWidget extends StatefulWidget {
final Appelsinbruger appelsinbruger;
const AllowNotificationWidget({Key? key, required this.appelsinbruger});
  @override
  State<StatefulWidget> createState() => _AllowNotificationWidget();
}

class _AllowNotificationWidget extends State<AllowNotificationWidget> {
late Appelsinapi _appelsinapi;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appelsinapi = Appelsinapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Notifikaitoner', style: TextStyle(fontSize: 20, fontFamily: 'FigTree', fontWeight: FontWeight.w400),),
      ),
      body: SafeArea(child: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Customwidgets.step(0.2, "2", "3"),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 90),
              child: Image.asset("assets/images/3x/appelsin_pos_skateboard@3x.png") ,
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 10),

              child: Text("Må vi sende dig notifikationer? \n  Det kan f.eks. være når du har modtaget en ny betaling.", style: TextStyle(fontSize: 16, fontFamily: 'FigTree', fontWeight: FontWeight.w400, height: 1.50), textAlign: TextAlign.center,) ,
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 90),

              child: ElevatedButton(onPressed:  () async {
                widget.appelsinbruger.send_notification = true;
              await  _appelsinapi.updateAppelsinBruger(widget.appelsinbruger);
                navigateWithSlide(context, AlmostDoneCreeateCompanyRampWidget(appelsinbruger: widget.appelsinbruger,), SlideDirection.right);
              }, child: Text("Ja, send mig notifikaitoner"),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 22)
              ),),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),

              child: ElevatedButton(onPressed: (){}, child: Text("Spring voer"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent.shade400,
                    fixedSize: Size(MediaQuery.of(context).size.width, 22)
                ),),
            )
          ],
        ),
      )),
    );
  }
}