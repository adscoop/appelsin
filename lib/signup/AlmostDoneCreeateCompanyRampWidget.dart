
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/createbusiess/CompanyCVRDetailsWidget.dart';
class AlmostDoneCreeateCompanyRampWidget extends StatefulWidget {
final Appelsinbruger appelsinbruger;

const AlmostDoneCreeateCompanyRampWidget({Key? key, required this.appelsinbruger}):super(key: key);
  @override
  State<StatefulWidget> createState() => _AlmostDoneCreeateCompanyRampWidget();

}

class _AlmostDoneCreeateCompanyRampWidget extends State<AlmostDoneCreeateCompanyRampWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tillykke, nu er du oprettet! ', style: TextStyle(fontFamily: 'FigTree', fontSize: 20, fontWeight: FontWeight.w400),),
      ),
body: SafeArea(child: Container(
  alignment: Alignment.center,
  margin: EdgeInsets.all(0),
  child: Column(
    children: [
      Container(

        margin: EdgeInsets.only(left: 16, right: 16 , top :100),
        width: 173,
        height: 196,
        child: Image.asset("assets/images/3x/appelsin_post_confetti@3x.png"),
      ),
      Container(
        margin: EdgeInsets.only(left: 16, right: 16 , top :20),
        child: Text("Du kan nu forbinde eller oprette din virksomhed i \n Appelsin.", style: TextStyle(color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
          fontSize: 16,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w400,
          height: 1.50,),textAlign: TextAlign.center,),
      ),
      Spacer(),
      Container(
        margin: EdgeInsets.only(left: 16, right: 16,bottom: 10),

        child: ElevatedButton(onPressed: () {
          navigateWithSlide(context, CompanyCVRDetailsWidget(appelsinbruger:  widget.appelsinbruger,), SlideDirection.right);
        }, child: Text("Forbind din virksomhed", style:  TextStyle(
          color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
          fontSize: 17,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w600,
        )), style:  ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width, 22)
        )),
      ),
      Container(
        margin: EdgeInsets.only(left: 16, right: 16 ),

        child: ElevatedButton(onPressed: () {}, child: Text("Opret nyt cvr", style:  TextStyle(
          color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
          fontSize: 17,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w600,
        )), style:  ElevatedButton.styleFrom(
          backgroundColor: Colors.orangeAccent.shade100,
            fixedSize: Size(MediaQuery.of(context).size.width, 22)
        )),
      ),
      Container(
        child: TextButton(child: Text('Se appen uden et tilknyttet cvr', style: TextStyle(
          color: const Color(0xFF0354F0) /* primary-fresh-blue-fresh-blue-100 */,
          fontSize: 14,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w600,
        )),onPressed: (){}
        ),
      )


    ],
  ),
)),
    );
  }
}