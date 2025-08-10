import 'package:flutter/material.dart';

class Emailwidget  extends StatefulWidget {
  @override
    State<StatefulWidget> createState()  =>_EmailWidget();

}
class _EmailWidget extends State<Emailwidget> {

  @override
    Widget build(BuildContext context) {
      return Scaffold(appBar: AppBar(),
      body: SafeArea(child: Container(
        child: Column(
          children: [
            Container(
              child: Text("Du har modtaget en E-mail"),
            )
          ],
        ),
      )),
      );
    }
}