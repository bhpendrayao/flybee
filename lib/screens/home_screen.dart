import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stealth/component/squarebutton.dart';
import 'package:stealth/component/boxbutton.dart';
import 'package:stealth/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stealth/screens/login_screen.dart';
import 'package:stealth/screens/welcome_screen.dart';
import 'package:stealth/screens/home_screen.dart';
import 'package:stealth/screens/profile_screen.dart';
import 'package:stealth/screens/inbox_screen.dart';
import 'package:stealth/screens/setting_screen.dart';


class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
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
        automaticallyImplyLeading: false,/// to remove back button
        title: Text('HOME',
            style: Theme.of(context).textTheme.headline6
        ),
        backgroundColor: Color(0xFFF01c2c8),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/Screenshot (7).png'),
                    ),
                  ),
                  Text('Hi{Name}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children :[
                  Column(
                    children: [
                      Card(
                        color: Color(0xFFFF009ca1),
                        child: Container(
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                             ),
                          child: Center(
                            child: Text(
                                'Your Trip',
                            style:TextStyle(
                                fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                            ),
                          ),
                        ),
                       // margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        color: Color(0xFFFF009ca1),
                        child: Container(
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle
                              ),
                          child: Center(
                            child: Text(
                                  'Prefernce Trip',
                              style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                       // margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        color: Color(0xFFFF009ca1),
                        child: Container(
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                             ),
                          child: Center(
                            child: Text(
                              'Previous Trip',
                              style:TextStyle(
                                fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                      //  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
                      ),
                    ],
                  ),
                ]
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                child: Text(
                  'Your Matches',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize:20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children :[
                    Card(
                      child:Container(
                        height: 60.0,
                          width:double.infinity,
                            child: Text('Button 1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                  fontWeight: FontWeight.bold,
                              fontSize:36.0,
                  ),),
                      ),
                      color: Color(0xFFFF009ca1),
                    ),
                    Card(
                      child:Container(
                        height: 60.0,
                        width:double.infinity,
                        child: Text('Button 2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            fontSize: 36.0,
                          ),),
                      ),
                      color: Color(0xFFFF009ca1),
                    ),
                    Card(
                      child:Container(
                        height: 60.0,
                        width:double.infinity,
                        child: Text('Button 3',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            fontSize: 36.0,
                          ),),
                      ),
                      color: Color(0xFFFF009ca1),
                    ),
                    Card(
                      child:Container(
                        height: 60.0,
                        width:double.infinity,
                        child: Text('Button 4',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            fontSize: 36.0,
                          ),),
                      ),
                      color: Color(0xFFFF009ca1),
                    ),
                    TextField(
                    ),
                  ]
              ),
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
