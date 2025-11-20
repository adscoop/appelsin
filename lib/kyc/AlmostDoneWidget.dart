
import 'package:appelsin/models/AppelsinBruger.dart';
import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';
import 'package:appelsin/bookFlow/BookingCalenderWidget.dart';

class AlmostDoneWidget extends StatefulWidget {
final Appelsinbruger appelsinbruger;

const AlmostDoneWidget({Key? key, required this.appelsinbruger}): super(key: key);
  @override
  State<StatefulWidget> createState() => _AlmostDoneWidget();

}

class _AlmostDoneWidget extends State<AlmostDoneWidget> {

  @override
  Widget build(BuildContext context) {  
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Færdig!', style: TextStyle(fontFamily: 'FigTree'),),
      ),
      body: SafeArea(child: Column(
        children: [

          Container(
            
            alignment: Alignment.center,
            child: Image.asset("assets/images/CleanShot 2025-08-27 at 12.23.02 1.png"),
          ),

          Container(
            child: Text("Tak - du har fortalt nok nu, book tid til sidste del af \n ansøgningen, som foregår telefonisk."),
          ),
          Spacer(),
          Container(
              margin: EdgeInsets.only(top: 20, left: 16, right: 15),
            child: ElevatedButton(onPressed: ( ){
              navigateWithSlide(context, BookingCalenderWidget(appelsinbruger: widget.appelsinbruger), SlideDirection.left);
            }, child: Text("Book tid"),
                style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 48),
      )
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 16, right: 15),
            child: ElevatedButton(onPressed: () {}, child: Text("Spring over"), style: ElevatedButton.styleFrom(
    fixedSize: Size(MediaQuery.of(context).size.width, 48),
    )) ,
          )
          

        ],
      )),
    );

  }
  Future<void> addKyc() async {

  }

}