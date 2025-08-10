
import 'package:flutter/material.dart';

class Namewidget   extends StatefulWidget
{
 @override
   State<StatefulWidget> createState()  => _Namewidget();
}

class _Namewidget extends State<Namewidget> {
  TextEditingController fornavm = TextEditingController();
  TextEditingController efternavn = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telefonnummer = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Kontakt oplysninger"),
      ),
      body: SafeArea(child: Container(
        child: form()
          ),

      ),
    );
    }

 Widget form(){
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Column(
        children: [
          label("Fornavm"),
          textField(fornavm),
          label("Efternavn"),
          textField(efternavn),
          label("E-mail"),
          textField(email),
          label("Telefon nummer"),
          textField(telefonnummer),
          Container(
            child: ElevatedButton(onPressed: () {}, child: Text("Videre")),
          )
        ],
      ),
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
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }
}
