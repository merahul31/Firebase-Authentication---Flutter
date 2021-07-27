import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_auth/screens/LoginScreen.dart';
import 'package:test_auth/screens/MainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;

  String name = "";
  String email = "";
  String password = "";
  double errorOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Opacity(
              opacity: errorOpacity,
              child: Padding(
                padding: EdgeInsets.only(left: 10, bottom: 5),
                child: Text(
                  'invaild credentials!!! Please check again.',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.name,
              textAlign: TextAlign.start,
              onChanged: (value) {
                setState(() {
                  errorOpacity = 0.0;
                });
                name = value;
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your name...',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.start,
              onChanged: (value) {
                setState(() {
                  errorOpacity = 0.0;
                });
                email = value;
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter email address...',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.start,
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  errorOpacity = 0.0;
                });
                password = value;
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter password...',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                '* Email eg: abc@xyz.com.\n* Password must be atleast of 6 characters.',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 12.0,
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Text("Register", style: TextStyle(fontSize: 18)),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              onPressed: () async {
                setState(() {
                  errorOpacity = 0.0;
                });
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    User user = FirebaseAuth.instance.currentUser;
                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(user.uid)
                        .set({
                      'uid': user.uid,
                      'email': email,
                      'name': name,
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  }
                } catch (e) {
                  Future.delayed(const Duration(milliseconds: 1000), () {
                    setState(() {
                      errorOpacity = 1.0;
                    });
                  });
                  print(e);
                }
              },
            ),
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text("Already have an account !!!",
                    style: TextStyle(fontSize: 18, color: Colors.black45)),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white30)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
