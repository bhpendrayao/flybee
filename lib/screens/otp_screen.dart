import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stealth/constants.dart';
import 'package:pinput/pinput.dart';
import 'package:stealth/screens/home_screen.dart';
import 'package:stealth/screens/login_screen.dart';
import 'package:stealth/screens/registration_screen.dart';

class Otp extends StatefulWidget {
  static String id = 'otp_screen';

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp>{
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code;
  @override
  Widget build(BuildContext context){
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 150.0,
                    child: Image.asset('images/stelath.jpeg'),
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Text(
                'Enter your OTP',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
            Pinput(
              length: 6,
              defaultPinTheme:PinTheme(
                width: 56,
                height: 42,
                textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              focusedPinTheme: focusedPinTheme,
              validator: (s) {
                return s.length==6 ? null : 'Enter a Valid OTP';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => code=pin,
            ),
            SizedBox(
              height: 90.0,
            ),
            Container(
              child: Column(
               children: [
                 ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     primary: Colors.grey,
                     minimumSize: const Size.fromHeight(50),
                   ),
                   child: Text(
                       'Verify the code'
                   ),// NEW
                   onPressed: () async{
                     try {
                       PhoneAuthCredential credential = PhoneAuthProvider.credential(
                           verificationId: LoginScreen.verify,
                           smsCode: code);
                       // Sign the user in (or link) with the credential
                       await auth.signInWithCredential(credential);
                       Navigator.popAndPushNamed(context, RegistrationScreen.id);
                     }
                     catch(e){
                     }
                   },
                 ),
                    TextButton(
                         onPressed:(){
                        Navigator.pushNamed(context,LoginScreen.id);
                          },
                         child:Text(
                                'Edit phone Number ?',
                        style: TextStyle(
                         color: Colors.blueGrey,
                           ),
                       ),
                        )
                      ],
                     )

            ),
          ],
        ),
      ),
    );
  }
}
