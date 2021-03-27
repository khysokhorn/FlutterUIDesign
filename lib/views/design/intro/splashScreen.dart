import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test123/utils/style/designStyle/designStyle.dart';
import 'package:test123/utils/widget/widgetDesign/widgetDesign.dart';
import 'package:test123/views/design/intro/introductionScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ScreenStyle.themeDate(),
      debugShowCheckedModeBanner: false,
      home: SplashScreenHome(),
    );
  }
}

class SplashScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => IntroductionScreen(),
        ),
      );
    });
    return Scaffold(
      backgroundColor: Colors.pink[400],
      body: Center(
        child: WidgetDesign().logo(),
      ),
    );
  }
}
