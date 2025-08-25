import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppelsinTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      // Tab bar theme
      tabBarTheme: TabBarThemeData(
        indicator: BoxDecoration(

          color: Colors.orange,
          borderRadius: BorderRadius.circular(8),

        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.orange,
        dividerColor: Colors.white,
        dividerHeight: 0,

      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orangeAccent.shade200,
          foregroundColor: Colors.black,

          side: BorderSide(
            style: BorderStyle.none,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )
        ),

      ),
      // Input decoration theme (TextFields)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: CupertinoDynamicColor.withBrightness(color: Colors.blue.shade900, darkColor: Colors.orangeAccent), width: 0.1
        )),
        fillColor: const Color(0xFFCCDDFE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: CupertinoDynamicColor.withBrightness(color: Colors.red, darkColor: Colors.redAccent))
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: CupertinoColors.activeBlue, width: 1.0),
        ),

      prefixIconColor: Colors.blue.shade400
      ),
      // Text styling (optional)
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18),
        bodyMedium: TextStyle(fontSize: 12),
        titleLarge: TextStyle(fontWeight: FontWeight.bold),




      ),
      textSelectionTheme: const TextSelectionThemeData(

      ),

      datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.orangeAccent.shade100,
      rangePickerBackgroundColor: Colors.deepOrange,
        inputDecorationTheme: InputDecorationTheme(

        )
      )
    );
  }
}
