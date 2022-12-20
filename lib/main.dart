import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stealth/screens/updateprofile_screen.dart';
import 'package:stealth/screens/welcome_screen.dart';
import 'package:stealth/screens/login_screen.dart';
import 'package:stealth/screens/registration_screen.dart';
import 'package:stealth/screens/home_screen.dart';
import 'package:stealth/screens/profile_screen.dart';
import 'package:stealth/screens/inbox_screen.dart';
import 'package:stealth/screens/setting_screen.dart';
import 'package:stealth/screens/changepassword_screen.dart';
import 'package:stealth/component/errors_screen.dart';
import 'package:stealth/screens/otp_screen.dart';


///void main() => runApp(Stealth());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Stealth());
}

class Stealth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Color(0xFFFFFFFF)),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes:{
        WelcomeScreen.id: (context)=>WelcomeScreen(),
        LoginScreen.id : (context)=>LoginScreen(),
        RegistrationScreen.id : (context)=>RegistrationScreen(),
        HomeScreen.id : (context)=>HomeScreen(),
        SettingScreen.id : (context)=>SettingScreen(),
        InboxScreen.id : (context)=>InboxScreen(),
        ProfileScreen.id : (context)=>ProfileScreen(),
        ChangepasswordScreen.id : (context)=>ChangepasswordScreen(),
        ErrorScreen.id : (context)=>ErrorScreen(),
        UpdateprofileScreen.id : (context)=>UpdateprofileScreen(),
        Otp.id : (context)=>Otp(),
      },
    );
  }
}


