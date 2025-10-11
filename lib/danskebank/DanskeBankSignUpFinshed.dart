import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Danskebanksignupfinshed  extends StatefulWidget{
  @override
    State<StatefulWidget> createState() =>_Danskebanksignupfinshed();
}

class _Danskebanksignupfinshed extends State<Danskebanksignupfinshed> {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sådan!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF392919) /* primary-dark-brown-dark-brown-100 */,
            fontSize: 20,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
    }
}
