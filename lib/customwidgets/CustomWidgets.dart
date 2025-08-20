import  'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customwidgets  {

static  Widget label(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 12, bottom: 4),
      child: Text(
        text,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
      ),
    );
  }

static  Widget textField(TextEditingController controller) {
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
