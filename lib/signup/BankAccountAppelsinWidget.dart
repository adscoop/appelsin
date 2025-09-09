import 'package:flutter/material.dart';
import 'package:appelsin/customwidgets/CustomWidgets.dart';
import 'package:appelsin/customwidgets/NavigatorDirection.dart';
import 'package:appelsin/customwidgets/SlideDirection.dart';


class BankAccountAppelsinWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BankAccountAppelsinWidget();
}


class _BankAccountAppelsinWidget extends State<BankAccountAppelsinWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Bankkonto med Appelsin'   , style: TextStyle(
            color: const Color(0xFF392919),
        fontSize: 20,
        fontFamily: 'Figtree',
        fontWeight: FontWeight.w400,
      )) ,
      ),
      body: SafeArea(child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
Container(
  child: Customwidgets.step(0.5, "step", "step2"),
)
          ],
        ),
      )),
    );
  }
}