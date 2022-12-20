import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:stealth/screens/home_screen.dart';

import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:stealth/component/squarebutton.dart';
///import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  ///mixins
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this, ///upperBound: 100.0
    );
    animation=ColorTween(begin: Colors.blueAccent,end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {

      });
    });
  }///animation part
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(    ///hero animation tag
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/stelath.jpeg'),
                    height: 150.0,
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                    '𝒇𝒍𝒚𝒃𝒂𝒆𝒛',///animated use for better
                  style: TextStyle(
                  color: Color(0xFFF01c2c8),
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: 90.0,
            ),
            Squarebutton(
              title: 'Continue With Phone Number',
              colour: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context,LoginScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

