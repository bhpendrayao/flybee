import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stealth/component/roundedbutton.dart';
import 'package:stealth/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stealth/screens/login_screen.dart';
import 'package:stealth/screens/welcome_screen.dart';
import 'package:stealth/screens/home_screen.dart';
import 'package:stealth/screens/profile_screen.dart';
import 'package:stealth/screens/inbox_screen.dart';
import 'package:stealth/screens/updateprofile_screen.dart';
import 'package:stealth/component/squarebutton.dart';
import 'package:stealth/screens/changepassword_screen.dart';


class SettingScreen extends StatefulWidget {
  static String id = 'setting_screen';
  @override
  _SettingScreenState createState() => _SettingScreenState();
}
class _SettingScreenState extends State<SettingScreen> {
  final _auth =FirebaseAuth.instance;
  User loggedInuser;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInuser = user;
        ///  print(loggedInuser.email);
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
        ],
        title: Text('SETTING',
            style: Theme.of(context).textTheme.headline6),
        backgroundColor: Color(0xFFF01c2c8),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFF01c2c8),
        child: Container(
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                color: Colors.black,
                ///padding: EdgeInsets.only(left: 8.0),
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context,HomeScreen.id);
                },
              ),
              IconButton(
                iconSize: 30.0,
                color: Colors.black,
                ///padding: EdgeInsets.only(left: 8.0),
                icon: Icon(Icons.inbox_sharp),
                onPressed: () {
                  Navigator.pushNamed(context,InboxScreen.id);
                },
              ),
              IconButton(
                iconSize: 30.0,
                color: Colors.black,
                ///padding: EdgeInsets.only(right: 1.0),
                icon: Icon(Icons.settings_applications),
                onPressed: () {
                  Navigator.pushNamed(context,SettingScreen.id);
                },
              ),
              IconButton(
                color: Colors.black,
                iconSize: 30.0,
                ///padding: EdgeInsets.only(right: 8.0),
                icon: Icon(Icons.person_pin_sharp),
                onPressed: () {
                  Navigator.pushNamed(context,ProfileScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          Squarebutton(
            title: 'Edit Profile' ,
            colour: Color(0xFFF01c2c8),
            onPressed: (){
              Navigator.pushNamed(context, UpdateprofileScreen.id);
            },
          ),//profile edit
            SizedBox.square(
              dimension:10.0,
            ),
            Squarebutton(
              title: 'Change Password' ,
              colour: Color(0xFFF01c2c8),
              onPressed: (){
              Navigator.pushNamed(context, ChangepasswordScreen.id);
              },
            ),//password
            SizedBox.square(
              dimension:10.0,
            ),
            Squarebutton(
              title: 'Push Notification' ,
              colour: Color(0xFFF01c2c8),
              onPressed: (){

              },
            ),
            SizedBox.square(
              dimension:10.0,
            ),
            Squarebutton(
              title: 'How to use flybaez' ,
              colour: Color(0xFFF01c2c8),
              onPressed: (){

              },
            ),
            SizedBox.square(
              dimension:10.0,
            ),
            Squarebutton(
              title: 'Help & Support' ,
              colour: Color(0xFFF01c2c8),
              onPressed: (){

              },
            ),
            SizedBox.square(
              dimension:10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF01c2c8)),
                  onPressed:(){
                     Navigator.popAndPushNamed(context, WelcomeScreen.id);
                   },
                      icon: Icon(
                          Icons.logout
                      ),
                label: Text ('Logout'),
              ),
            ),
        ],
        ),
      ),
    );
  }
}
