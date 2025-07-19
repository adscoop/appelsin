
import 'package:flutter/material.dart';

class Biometricwidget extends StatefulWidget {
  @override
    State<StatefulWidget> createState() => _Biometricwidget();
}

class _Biometricwidget extends State<Biometricwidget> {
  
  @override
    Widget build(BuildContext context) {

    return  Scaffold(
      appBar:  AppBar(),
      body: SafeArea(child: Container(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              child: Text("Image")
            )
          ],
        ),
      )),
    );
    }
}