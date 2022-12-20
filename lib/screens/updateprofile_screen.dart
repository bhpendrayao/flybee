import 'package:flutter/material.dart';
import 'package:stealth/constants.dart';
import 'package:stealth/screens/profile_screen.dart';

class UpdateprofileScreen extends StatefulWidget {
  static String id = 'updateprofile_screen';
  @override
  _UpdateprofileScreenState createState() => _UpdateprofileScreenState();
}

class _UpdateprofileScreenState extends State<UpdateprofileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:
            Text('EditProfile', style: Theme.of(context).textTheme.headline6),
        backgroundColor: Colors.black54,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.yellowAccent),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              Form(
                child: Column(
                  children: [
                    TextField(
                      obscureText: false,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: kmext.copyWith(
                        hintText:'Name',
                        prefixIcon: Icon(Icons.person),
                      )

                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    TextField(
                        obscureText: false,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        decoration: kmext.copyWith(
                          hintText:'Mobile Number',
                          prefixIcon: Icon(Icons.contacts),
                        )

                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    TextField(
                        obscureText: false,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        decoration: kmext.copyWith(
                          hintText:'Email id',
                          prefixIcon: Icon(Icons.mail),
                        )

                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                     SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:(){
                    Navigator.pushNamed(context, ProfileScreen.id);
                  },
                  child:Text(
                    'Save',
                    style: TextStyle(
                     color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
