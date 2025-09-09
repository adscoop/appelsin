

import 'package:flutter/material.dart';
import 'customwidgets/CustomWidgets.dart' as  cw;
class Loginwidget extends StatefulWidget {
  @override
    State<StatefulWidget> createState() => _Loginwidget();
}

class _Loginwidget extends State<Loginwidget> {
  TextEditingController login = TextEditingController();

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scaffold(
        body: SafeArea(child: Container(
          child: Column(
                  children: [


                  cw.Customwidgets.buildLabel("Login"),
                      cw.Customwidgets.textField(login)
                    
                  ],  
          ),
        )),
      ),
    );
    }

}