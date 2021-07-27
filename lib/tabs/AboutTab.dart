import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutTab extends StatefulWidget {
  @override
  _AboutTabState createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 10,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 5, bottom: 20),
                    child: Icon(
                      Icons.location_city,
                      size: 50,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Test App',
                            style: TextStyle(fontSize: 22,
                              fontFamily: 'Acme',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Test App created By Rahul Sharma',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'App Version: 1.0.1.',
                            // use package_info package to get the current app version.
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height) / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Our Motto:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nisl eros, dignissim sed egestas ut, tempus ac dolor. Nam accumsan dolor magna, a egestas quam blandit vitae. Cras ac ipsum.''',
                    maxLines: 10,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Contact:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Phone: +91 9876543210'),
                    onTap: () => {
                      ToastView.createView(
                          'Trial Version',
                          context,
                          Toast.LENGTH_SHORT,
                          Toast.BOTTOM,
                          Colors.black87,
                          Colors.white,
                          20,
                          null),
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.paste_outlined),
                    title: Text('Privacy Policy'),
                    onTap: () => {
                      ToastView.createView(
                          'Trial Version',
                          context,
                          Toast.LENGTH_SHORT,
                          Toast.BOTTOM,
                          Colors.black87,
                          Colors.white,
                          20,
                          null),
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.feedback_outlined),
                    title: Text('Feedback'),
                    onTap: () => {
                      ToastView.createView(
                          'Trial Version',
                          context,
                          Toast.LENGTH_SHORT,
                          Toast.BOTTOM,
                          Colors.black87,
                          Colors.white,
                          20,
                          null),
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Connect With Us',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(FontAwesomeIcons.facebook),
                      Icon(FontAwesomeIcons.instagram),
                      Icon(FontAwesomeIcons.linkedin),
                      Icon(FontAwesomeIcons.twitter),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
