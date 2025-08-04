import 'package:flutter/material.dart';

class Profilewidget  extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => _Profilewidget();
}

class _Profilewidget extends State<Profilewidget> {
  @override
    Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Align(
         alignment: Alignment.topCenter,
             child: Text("Profile"),
       ),
     ),
     body: SafeArea(child: Container(
       margin: EdgeInsets.all(0),
       child: Column(
         children: [
           Container()
         ],
       ),
     )),
   );
    }
}