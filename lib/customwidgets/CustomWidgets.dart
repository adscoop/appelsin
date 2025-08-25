import  'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customwidgets  {

static  Widget label(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 12, bottom: 12),
      child: Text(
        text,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
      ),
    );
  }

static Widget textField(
    TextEditingController controller, {
      Widget? prefix,
      Widget? suffix,
      String? label,
      String? prefixText
    }) {
  return Container(
    margin: EdgeInsets.only(left: 16, right: 16),
    height: 76,
    width: 376,
    child: TextField(
      cursorHeight: 12,
      controller: controller,
      style: const TextStyle(fontSize: 12),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        prefixIcon: prefix,
        suffixIcon: suffix,
        prefixText: prefixText,
        labelText: label,
      ),
    ),
  );
}


}
