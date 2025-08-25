

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pincodesetupwidget  extends StatefulWidget {

  @override
    State<StatefulWidget> createState()  => _Pincodesetupwidget();
}


class _Pincodesetupwidget extends State<Pincodesetupwidget>{
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pin-kode", style: TextStyle(fontFamily: 'Sora', fontSize: 20),),
      ),
      body: SafeArea(

          child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(0),
        child: Column(
          children: [

            Container(
              child: Text("Angiv en firecifret PIN-kode der skal bruges når du vil \nlogge ind i Appelsin app’en."),
            ),
            Container(

alignment: Alignment.center,

              margin: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                 textbox(textEditingController1),
                  textbox(textEditingController2),
                  textbox(textEditingController3),
                  textbox(textEditingController4)
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 22)
                  ),
                  onPressed: (){}, child: Text("Videre")),
            )
          ],
        ),
      )),
    ) ;
  }

  Widget textbox(TextEditingController t){
    return Container(
      margin: EdgeInsets.only(left: 7,right: 7, bottom: 50, top: 50),
      width: 55,
      height: 55,

      child: TextField(controller: t) ,
    );
  }

}