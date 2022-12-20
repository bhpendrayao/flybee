import 'package:flutter/material.dart';
import 'package:stealth/component/roundedbutton.dart';
import 'package:stealth/screens/home_screen.dart';
import 'package:stealth/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stealth/screens/login_screen.dart';


class ChangepasswordScreen extends StatefulWidget {
  static String id = 'changepassword_screen';
  @override
  _ChangepasswordScreenState createState() => _ChangepasswordScreenState();
}

class _ChangepasswordScreenState extends State<ChangepasswordScreen> {
  final _auth =FirebaseAuth.instance;
  String old='',newp='',newpc='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
        ],
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: false,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              onChanged: (value) {
                old=value;
              },
              decoration: kText.copyWith(hintText: 'Old Password',prefixIcon: Icon(Icons.password)),
            ),//oldpassword
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: false,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              onChanged: (value) {
                newp=value;
              },
              decoration: kText.copyWith(hintText: 'New Password',prefixIcon: Icon(Icons.password)),
            ),//newpassword
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: false,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              onChanged: (value) {
                newpc=value;
              },
              decoration: kText.copyWith(hintText: 'ConfirmPassword',prefixIcon: Icon(Icons.password)),
            ),//confirm password 
            SizedBox(
              height: 8.0,
            ),
            Roundedbutton(
              title: 'Save',
              colour: Colors.teal,
              onPressed: (){
              },
            ),
          ],
        ),
      ),
    );
  }
}