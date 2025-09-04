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
      backgroundColor: const Color(0xFFE0EAFF),
      elevation: 2,
      dividerColor: Colors.orange,
      headerBackgroundColor: const Color(0xFF3B82F6),
      headerForegroundColor: Colors.white,
      headerHeadlineStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      headerHelpStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      weekdayStyle: const TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.2),
      dayStyle: const TextStyle(fontSize: 9),

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5),
        )),

        dayShape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4), // or 0 for sharp square
          ),
        ),
      

dayForegroundColor: WidgetStatePropertyAll(Colors.black),
        
        // Today outline (optional)
        todayBorder: const BorderSide(color: Colors.lightBlue, width: 2),
        todayForegroundColor: const WidgetStatePropertyAll(Colors.white),
        todayBackgroundColor: WidgetStatePropertyAll(Colors.blue),
        dayOverlayColor: WidgetStatePropertyAll(const Color(0xFF3B82F6)),
    ),

      chipTheme: ChipThemeData(backgroundColor: Colors.white,
        shape: StadiumBorder()
      ),
      checkboxTheme: CheckboxThemeData(

      ),
      radioTheme: RadioThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
fillColor: WidgetStatePropertyAll(Colors.blue),
        overlayColor: WidgetStatePropertyAll(Colors.blue),

      ),

    );
  }
}
