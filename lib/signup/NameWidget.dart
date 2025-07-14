
import 'package:flutter/material.dart';

class Namewidget   extends StatefulWidget
{
 @override
   State<StatefulWidget> createState() {
     // TODO: implement createState
     throw UnimplementedError();
   }
}

class _Namewidget extends State<Namewidget> {
  TextEditingController fornavm = TextEditingController();
  TextEditingController efternavn = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Navn"),
      ),
      body: SafeArea(child: Container(
        child: Container(
          padding: EdgeInsets.all(0),
          margin:  EdgeInsets.all(0),
          child: Column(
            children: [
              Container(),
              Container(
                child: TextField(
                  controller: fornavm,
                ) ,
              ),
              Container(
                child: TextField(
                  controller:  efternavn,
                ),
              ),
              Container(
                child: ElevatedButton(onPressed: (){}, child: Text("Videre")),
              )
            ],
          ),
        ),
      )),
    );
    }
}
