

import 'package:flutter/material.dart';

class Verifyphonenumberwidget extends StatefulWidget {
  final int phonenumber;

  const Verifyphonenumberwidget({Key? key, required this.phonenumber}): super(key: key);

  @override
    State<StatefulWidget> createState()  => _Verifyphonenumberwidget();
}


class _Verifyphonenumberwidget extends State<Verifyphonenumberwidget> {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar:  AppBar(
          title: Text("Verificere dit telefonmummer"),
        ),
        body:  Container(
        child: Column(
          children: [

          ],
        ),
        ),
      );
    }

}