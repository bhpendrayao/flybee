import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
const kText=InputDecoration(
  hintText:'Enter your detail',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  prefixIcon: Icon(Icons.person),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
const kmext=InputDecoration(
  hintText:'enter detail',
  prefixIcon: Icon(Icons.person),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
  ),
);
const klext=InputDecoration(
  // fillColor: Colors.black,
  //filled: true,
  hintStyle: TextStyle(
    color: Colors.black,
  ),
  hintText:'enter detail',
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
);
const kjext=InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
  ),
);