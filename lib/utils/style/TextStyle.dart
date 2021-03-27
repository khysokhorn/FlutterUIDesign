import 'package:flutter/material.dart';
import 'package:test123/utils/constant/Deminsion.dart';

class MyTextStyle {
  static TextStyle textStyle({Color color = Colors.white}) {
    return TextStyle(
      color: color,
      fontSize: MyDeminsion.fontSize,
    );
  }
}
