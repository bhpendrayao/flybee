import 'dart:developer';
import 'package:stealth/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:stealth/component/squarebutton.dart';
import 'package:stealth/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stealth/screens/home_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stealth/screens/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  static String verify=" ";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Service service = Service();
  final _auth = FirebaseAuth.instance;
  String number='';
  var colour=Colors.grey;
  static String verify=" ";//teleporting value
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                 child: Hero(
                tag: 'logo',
                child: Container(
                  height: 150.0,
                  child: Image.asset('images/stelath.jpeg'),
                ),
              ),
            ),
              Container(
                child: Text(
                  'Enter phone number      for verification',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              Theme(
                  data: ThemeData.light(),
                  child: IntlPhoneField(
                  dropdownIconPosition: IconPosition.trailing,
                decoration: InputDecoration(
                  labelText: 'Your Number',
                  labelStyle:TextStyle(
                    color: Colors.blueGrey,
                  ),
                  counterStyle: TextStyle(
                    color: Colors.black
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                dropdownTextStyle: TextStyle(
                  color: Colors.black,
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  number=phone.completeNumber;
                  if(number!=null)
                    {
                      colour=Colors.black;
                    }
                }
              )// learn more about it
            ),
            SizedBox(
              height: 90.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: colour,
                minimumSize: const Size.fromHeight(50),
              ),
                child: Text(
                  'Next'
                ),// NEW
              onPressed: () async{
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: number,
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int resendToken) {
                    LoginScreen.verify=verificationId;
                    Navigator.popAndPushNamed(context,Otp.id);
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
               },
            ),
          ],
        ),
      ),
    );
  }
}