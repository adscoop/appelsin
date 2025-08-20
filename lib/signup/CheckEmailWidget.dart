import 'package:flutter/material.dart';

class Checkemailwidget extends StatefulWidget {


  @override
    State<StatefulWidget> createState() => _Checkemailwidget();
}

class _Checkemailwidget extends State<Checkemailwidget> {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
      title: Text("Validere E-mail", style: TextStyle(fontFamily: "FigTree", fontSize:30),),
    ),
      body: SafeArea(child: Container(
        child: Column(
          children: [

            Container(
              alignment: Alignment.center,
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Text("Du har modtaget en e-mail")),
            Spacer(),

          ],
        ),
      )),
    );
    }
}