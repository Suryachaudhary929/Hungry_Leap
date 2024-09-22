import 'package:flutter/material.dart';
const primarycolors = Color.fromARGB(218, 4, 151, 9);

class AppWidget {
  
   static TextStyle appcolor() {
   return TextStyle(
        color:primarycolors,
        fontSize: 30,
        fontWeight: FontWeight.bold);
  }
   static TextStyle blackcolor() {
   return TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500);
  }
   static TextStyle whitecolor() {
   return TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold);
  }
  static TextStyle color() {
   return TextStyle(
        color: Color.fromARGB(218, 4, 151, 9),
        fontSize: 24,
        fontWeight: FontWeight.bold);
  }
  static TextStyle bkcolor() {
   return TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w500);
  }
  static TextStyle gcolor() {
   return TextStyle(
        color: Color.fromARGB(218, 4, 151, 9),
        fontSize: 20  ,
        fontWeight: FontWeight.bold);
  }
  static TextStyle Bcolor() {
   return TextStyle(
        color: Colors.black,
        fontSize: 34,
        fontWeight: FontWeight.w500);
  }
  static TextStyle BBcolor() {
   return TextStyle(
        color: const Color.fromARGB(255, 15, 12, 12),
        fontSize: 18,
        fontWeight: FontWeight.w400);
  }
  static TextStyle greycolor() {
   return TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.9));
  }
}
