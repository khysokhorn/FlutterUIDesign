import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test123/views/design/intro/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}
