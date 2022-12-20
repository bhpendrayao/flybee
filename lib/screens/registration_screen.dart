import 'package:flutter/material.dart';
import 'package:stealth/component/roundedbutton.dart';
import 'package:stealth/screens/home_screen.dart';
import 'package:stealth/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  static String email = "";
  static String password = '';
  static String firstname = '';
  static String lastname = '';
  static String number = '';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[],
        backgroundColor: Color(0xFFF01c2c8),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Theme(data: ThemeData.light(),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    TextField(
                      obscureText: false,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        RegistrationScreen.firstname = value;
                      },
                      decoration: kText.copyWith(
                          hintText: 'Enter Your  FirstName',
                          prefixIcon: Icon(Icons.person)),
                    ), //1name
                    SizedBox(
                      height: 50.0,
                    ),
                    TextField(
                      obscureText: false,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        RegistrationScreen.lastname = value;
                      },
                      decoration: kText.copyWith(
                          hintText: 'Enter Your  LastName',
                          prefixIcon: Icon(Icons.person)),
                    ), //lastname
                    SizedBox(
                      height: 50.0,
                    ),
                    TextField(
                      obscureText: false,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        RegistrationScreen.number = value;
                      },
                      decoration: kText.copyWith(
                          hintText: 'Enter Your Mobile Number',
                          prefixIcon: Icon(Icons.contacts)),
                    ), //mobile number
                    SizedBox(
                      height: 50.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        RegistrationScreen.email = value;
                      },
                      decoration: kText.copyWith(
                          hintText: 'Enter your Email', prefixIcon: Icon(Icons.mail)),
                    ), //for email
                    SizedBox(
                      height: 50.0,
                    ), //for password
                    SizedBox(
                      height: 24.0,
                    ),
                    Roundedbutton(
                      title: 'Save',
                      colour: Color(0xFFF01c2c8),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, HomeScreen.id);
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                      backgroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, HomeScreen.id);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),)
          ],
        ),
      ),
    );
  }
}
