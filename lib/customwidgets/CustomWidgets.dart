import  'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
class Customwidgets  {

   static double _kLabelMarginTop = 5;
    static double _kLabelMarginBottom = 3;

static   TextStyle kLabelTextStyle = TextStyle(
    color: Color(0xFF392919),
    // primary-dark-brown-dark-brown-100
    fontSize: 16,
    fontFamily: 'Figtree',
    fontWeight: FontWeight.w400,
    height: 1.25,
  );

  static Widget buildLabel(String text, {
    double left = 0,
    double right = 0,
    EdgeInsetsGeometry? margin,
    TextStyle? style,
  }) {
    final EdgeInsetsGeometry effectiveMargin = margin ??
        EdgeInsets.only(
          top: _kLabelMarginTop,
          bottom: _kLabelMarginBottom,
          left: left,
          right: right,
        );

    return Container(
      alignment: Alignment.centerLeft,
      margin: effectiveMargin,
      child: Text(
        text,
        style: style ?? kLabelTextStyle,
      ),
    );
  }

static Widget textField(
    TextEditingController controller, {
      Widget? prefix,
      Widget? suffix,
      String? label,
      String? prefixText,
      TextAlign? textAlign
    }) {
  return Container(
    margin: EdgeInsets.only(left: 16, right: 16),
    height: 76,
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


static Widget step(double procent , String step , String step2) {
 return Container(
    padding: const EdgeInsets.only(top: 8, left: 8, right: 12, bottom: 8),
    decoration: ShapeDecoration(
      color: const Color(0xFFFFF7EB) /* primary-juicy-orange-juicy-orange-5 */,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 12,
      children: [
       Container(
         child: new CircularPercentIndicator(radius: 10, percent: procent, backgroundColor: Colors.white, circularStrokeCap: CircularStrokeCap.round,progressBorderColor: Colors.orange,)
       ),
        Text(
          'Trin ${step} af ${step2}',
          style: TextStyle(
            color: const Color(0xFF231303) /* primary-dark-brown-dark-brown-200 */,
            fontSize: 14,
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

}
