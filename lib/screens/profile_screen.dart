import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stealth/component/roundedbutton.dart';
import 'package:stealth/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stealth/screens/home_screen.dart';
import 'package:stealth/screens/inbox_screen.dart';
import 'package:stealth/screens/setting_screen.dart';
import 'package:stealth/screens/registration_screen.dart';
import 'package:stealth/screens/updateprofile_screen.dart';

class ProfileScreen extends StatefulWidget {
  static String id = 'profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInuser;
  String name=RegistrationScreen.firstname + RegistrationScreen.lastname;
  String email=RegistrationScreen.email;
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
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var isDark =MediaQuery.of(context).platformBrightness==Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        /// to remove back button
        title: Text('Profile',
            style: Theme.of(context).textTheme.headline6),
        backgroundColor:Color(0xFFF01c2c8),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(isDark?Icons.sunny:Icons.nightlight),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
           padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width:120,
                    height: 120,
                      child: CircleAvatar(
                         backgroundImage: AssetImage('images/Screenshot (7).png'),
                      ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.yellowAccent)
                      ,
                      child: const Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 20,
                    ),
                    ),
                  ),
                ],
              ),//image
              const SizedBox(height: 15.0,),
              Text( name,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(email,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20.0,),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed:(){
                      Navigator.pushNamed(context, UpdateprofileScreen.id);
                    },
                    child:Text(
                      'Edit profile',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),//edit button
              const SizedBox(height: 30.0,),
              const Divider(),// because of divider sb centre hogya
              const SizedBox(height: 10.0,),
            ],
          ),
        ),
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
                  Navigator.pushNamed(context, HomeScreen.id);
                },
              ),
              IconButton(
                iconSize: 30.0,
                color: Colors.black,

                ///padding: EdgeInsets.only(left: 8.0),
                icon: Icon(Icons.inbox_sharp),
                onPressed: () {
                  Navigator.pushNamed(context, InboxScreen.id);
                },
              ),
              IconButton(
                iconSize: 30.0,
                color: Colors.black,

                ///padding: EdgeInsets.only(right: 1.0),
                icon: Icon(Icons.settings_applications),
                onPressed: () {
                  Navigator.pushNamed(context, SettingScreen.id);
                },
              ),
              IconButton(
                color: Colors.black,
                iconSize: 30.0,

                ///padding: EdgeInsets.only(right: 8.0),
                icon: Icon(Icons.person_pin_sharp),
                onPressed: () {
                  Navigator.pushNamed(context, ProfileScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
