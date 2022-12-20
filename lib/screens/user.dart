import 'package:flutter/material.dart';
class User1{
  final String imagepath;
  final String name;
  final String email;
  final String about;
  final bool isdarkmode;

  const User1({
    @required this.name,
       @required this.imagepath,
    @required this.email,
    @required this.about,
    @required this.isdarkmode,
      });

}
