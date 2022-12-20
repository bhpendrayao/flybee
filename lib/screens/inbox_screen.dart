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
import 'package:stealth/screens/setting_screen.dart';


class InboxScreen extends StatefulWidget {
  static String id = 'inbox_screen';
  @override
  _InboxScreenState createState() => _InboxScreenState();
}
class _InboxScreenState extends State<InboxScreen> {
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
      backgroundColor:Colors.orangeAccent,
      appBar: AppBar(
        ///leading: null,
        automaticallyImplyLeading: false,/// to remove back button
        title: Text('INBOX',
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
    );
  }
}
