import 'package:test_auth/screens/MainScreen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_auth/screens/SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  double errorOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Opacity(
              opacity: errorOpacity,
              child: Padding(
                padding: EdgeInsets.only(left: 10, bottom: 5),
                child: Text(
                  'invaild credentials!!! Please check again.',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.start,
              onChanged: (value) {
                setState(() {
                  errorOpacity = 0.0;
                });
                email = value;
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
              height: 8,
            ),
            TextField(
              textAlign: TextAlign.start,
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  errorOpacity = 0.0;
                });
                password = value;
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
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                '* Email eg: abc@xyz.com.\n* Password must be atleast of 6 characters.',
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Text("Login", style: TextStyle(fontSize: 18)),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              onPressed: () async {
                setState(() {
                  errorOpacity = 0.0;
                });

                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  }
                  setState(() {});
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
            SizedBox(
              height: 2,
            ),
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text("Create a new account !!!",
                    style: TextStyle(fontSize: 18, color: Colors.black45)),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white30)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
