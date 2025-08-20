import 'package:flutter/material.dart';

class Telefonnummerwidget extends StatefulWidget {
  @override
    State<StatefulWidget> createState() => _Telefonnummerwidget();
}

class _Telefonnummerwidget extends State<Telefonnummerwidget> {
  
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar:  AppBar(
          title: Text("Dit telefon nummer"),
        ),
        body: SafeArea(child: Container(
    child: Column(
      children: [
      Container(child: Text("Vi skal have dit telefon nummer valideret \n Du vil modtage en sms med et link ",style:  TextStyle(fontFamily: 'Sora'),)),
      Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        height: 30,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              textAlign: TextAlign.justify,
              decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              prefixText: "+45",
              suffixIcon: Icon(Icons.delete),
              suffixIconColor: Colors.blue.shade200,
errorMaxLines: 9,
hint: Text("  00 00 00 00"),

            ),
            style: TextStyle(fontFamily: 'sora', fontSize: 12, ),
            ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: ElevatedButton(
style: ElevatedButton.styleFrom(
  fixedSize: Size(MediaQuery.of(context).size.width, 23)
),
              onPressed: (){

              }, child: Text("Videre")),
        )
    ],
    ),
    )));
    }
}