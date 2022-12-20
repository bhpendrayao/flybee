import 'package:flutter/material.dart';

class Squarebutton extends StatelessWidget {
Squarebutton({this.title,this.colour, @required this.onPressed});

final Color colour;
final String title;
final Function onPressed;
@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(32.0),
    child: Material(
     color: colour,
    /// borderRadius: BorderRadius.circular(30.0),
     ///elevation: 5.0,
     child:  MaterialButton(
       onPressed: onPressed,
       minWidth: double.infinity,
       height: 42.0,
       child: Text(
         title,
       ),
     ),
      ),
  );
}
}