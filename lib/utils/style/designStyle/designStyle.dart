import 'package:flutter/material.dart';

class ScreenStyle {
  static ThemeData themeDate() {
    return ThemeData(
      primaryColor: Colors.redAccent[400],
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.redAccent[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      buttonColor: Colors.redAccent[400],
      dividerTheme: DividerThemeData(
        color: Colors.grey[200],
        thickness: 0.4,
      ),
      hintColor: Colors.grey,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.redAccent[400],
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.only(bottom: 10),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.redAccent[400],
        elevation: 5.0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
          backgroundColor: MaterialStateProperty.all(Colors.redAccent[400]),
        ),
      ),
    );
  }
}
