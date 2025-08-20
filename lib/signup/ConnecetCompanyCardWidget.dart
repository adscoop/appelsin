import 'package:flutter/material.dart';

class Connecetcompanycardwidget  extends StatefulWidget {
  @override
    State<StatefulWidget> createState()  => _Connecetcompanycardwidget();
}


class _Connecetcompanycardwidget extends State<Connecetcompanycardwidget> {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: SafeArea(child: Container(
        child: Column(
          children: [

            Container(
              width: 400,
              height: 600,

            )
            ,Container(
              child: ElevatedButton(onPressed: (){}, child: Text("Forbind firma kort")),
            ),
            Container(
              child: ElevatedButton(onPressed: () {}, child: Text("Spring over for nu"
              )),
            )
          ],
        ),
      )),
    );
    }
}