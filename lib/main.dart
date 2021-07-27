import 'package:flutter/material.dart';
import 'package:test_auth/screens/MainScreen.dart';
import 'screens/WelcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    // TODO: implement build
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}
