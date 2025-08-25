
import 'package:appelsin/apis/AppelsinApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sendsmsvalidatewidgete extends StatefulWidget {
final String phone;
final String prefix;
const Sendsmsvalidatewidgete({Key? key,required this.prefix ,required this.phone}): super(key: key);
  @override
    State<StatefulWidget> createState()  => _Sendsmsvalidatewidget();

}

class _Sendsmsvalidatewidget extends State<Sendsmsvalidatewidgete> {
late Appelsinapi _appelsinapi;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appelsinapi = Appelsinapi();
    sendSms();
  }

  Future<void> sendSms() async {
  try {
    print(widget.phone);
    final response = _appelsinapi.sendSms('${widget.prefix}${widget.phone}');

  } catch (e) {

  }
  }

  @override
    Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
         backgroundColor: Colors.white,
       ),
       body: SafeArea(child: Container(
         margin: EdgeInsets.all(0),
         decoration: BoxDecoration(
           color: Colors.white
         ),
child:  Stack(
  children: [
   Positioned.fill(
       child: Align(alignment: Alignment.center,
       child: Text("Du vil om kort tid modtage en SMS \n Klik på linket i sms for at forsætte", style: TextStyle(fontFamily: 'FigTree', fontSize: 14),),
       ),)
  ],
),

       )),
     );
    }
}