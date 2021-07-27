import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_auth/tabs/AboutTab.dart';
import 'package:test_auth/tabs/HomeTab.dart';
import 'package:test_auth/tabs/ProductTab.dart';
import 'package:toast/toast.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  String UserName = " ";

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  final tabs = [
    HomeTab(),
    ProductTab(),
    AboutTab(),
  ];

  getUserName() {
    User user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get()
        .then((snapshot) {
      {
        setState(() {
          UserName = snapshot.data()["name"];
        });
      }
      ;
    });
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test App"),
        actions: [
          IconButton(
            onPressed: () => {
              signOut(),
              Navigator.pop(context),
              ToastView.createView(
                  'User is Sign Out',
                  context,
                  Toast.LENGTH_SHORT,
                  Toast.TOP,
                  Colors.black87,
                  Colors.white,
                  20,
                  null),
            },
            icon: Icon(Icons.logout_rounded),
          ),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 150,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      offset: Offset(0, 5),
                    ),
                  ],
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(15)),
                  color: Colors.blue,
                ),
                child: Center(
                    child: Text(
                  UserName.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 22),
                )),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_rounded),
              title: Text('Products'),
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.live_help),
              title: Text('About'),
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: tabs[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        iconSize: 30,
        selectedFontSize: 14,
        unselectedFontSize: 10,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black45,
        selectedIconTheme: IconThemeData(
          color: Colors.redAccent,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            title: Text('Products'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_help),
            title: Text('About'),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
