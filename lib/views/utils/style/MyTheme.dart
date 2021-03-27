import 'package:flutter/material.dart';

class MyThemeData {
  ThemeData lightGreenTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.green,
      accentColor: Colors.amber,
      buttonColor: Colors.yellow,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.green,
        textTheme: ButtonTextTheme.primary,
      ),


      
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 24,
      ),


      // fix text default color here
      textTheme: TextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
          decorationColor: Colors.white),
    );
  }

  static TextStyle hintStyle() {
    return TextStyle(color: Colors.grey[400]);
  }

  static InputDecoration inputDecoration(String hinit) {
    return InputDecoration(
        hintText: hinit, hintStyle: hintStyle(), border: InputBorder.none);
  }
}
