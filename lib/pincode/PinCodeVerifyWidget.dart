import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Pincodeverifywidget extends StatefulWidget{
  
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      throw UnimplementedError();
    }
}


class _Pincodeverifywidget  extends State<Pincodeverifywidget>{

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pin"),
      ),
      body: SafeArea(

          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(0),
            child: Column(
              children: [
                Container(
                  height: 200,
                ),
                Container(


                  margin: EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      onPressed: (){
                        int pin = int.parse("${textEditingController1.value.text}${textEditingController2.value.text}${textEditingController3.value.text}${textEditingController4.value.text}");
                        savePin(pin);

                      }, child: Text("Videre")),
                )
              ],
            ),
          )),
    ) ;
  }

  Widget textbox(TextEditingController t){
    return Container(
      margin: EdgeInsets.all(6),
      width: 55,
      height: 55,

      child: TextField(controller: t) ,
    );
  }

  Future<void> savePin(int pin) async {
 final shared =   await SharedPreferences.getInstance();
 shared.setInt("pin", pin);
  }

}