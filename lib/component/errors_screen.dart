import 'package:flutter/material.dart';
import 'package:stealth/screens/login_screen.dart';
import 'package:stealth/component/roundedbutton.dart';

class ErrorScreen extends StatefulWidget {
static String id = 'error_screen';
@override
_ErrorScreenState createState() => _ErrorScreenState();
}
class _ErrorScreenState extends State<ErrorScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor:Colors.blueGrey,
            body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
             child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: <Widget>[
                          Container(
                             height: 200.0,
                             child: Image.asset('images/Screenshot (6).png'),
                         ),
                           Center(
                             child: Material(
                                 color: Colors.yellowAccent,
                                /// borderRadius: BorderRadius.circular(30.0),
                                 elevation: 5.0,
                               child: MaterialButton(
                                 autofocus: true,
                                   child: Text(
                                       'Try Again',
                                       style: TextStyle(
                                           color:Colors.black,
                                           fontSize: 30),
                                   ),
                                   onPressed: (){
                                       Navigator.popAndPushNamed(context,LoginScreen.id);
                                   },
              ),
                             ),
              ),
        ],
        ),
        ),
        );
    }
}