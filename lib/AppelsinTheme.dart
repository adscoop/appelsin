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
        style: ButtonStyle()
      ),
      // Input decoration theme (TextFields)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: CupertinoDynamicColor.withBrightness(color: Colors.orange, darkColor: Colors.orangeAccent), width: 0.1
        )),
        fillColor: Colors.white70,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: CupertinoDynamicColor.withBrightness(color: Colors.red, darkColor: Colors.redAccent))
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: CupertinoColors.systemOrange, width: 0.1),
        ),
      ),

      // Text styling (optional)
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18),
        bodyMedium: TextStyle(fontSize: 16),
        titleLarge: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
