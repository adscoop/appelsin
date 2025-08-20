
import 'package:appelsin/signup/CheckEmailWidget.dart';
import 'package:flutter/material.dart';

class Emailwidget  extends StatefulWidget {
  @override
    State<StatefulWidget> createState()  =>_EmailWidget();

}
class _EmailWidget extends State<Emailwidget> {
TextEditingController emailcontroller = TextEditingController();
  @override
    Widget build(BuildContext context) {
      return Scaffold(appBar: AppBar(),
      body: SafeArea(child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),

        child: Column(
          children: [
           label("E-mail"),
            textField(emailcontroller),
            Spacer(),
            Container(
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  Checkemailwidget()));


              }, child: Text("Forsæt")),
            )
          ],
        ),
      )),
      );
    }



  Widget label(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 12, bottom: 4),
      child: Text(
        text,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget textField(TextEditingController controller) {
    return Container(
      height: 35,
      child: TextField(
        cursorHeight: 12,
        controller: controller,
        style: TextStyle(fontSize: 12),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
      ),
    );
  }
}