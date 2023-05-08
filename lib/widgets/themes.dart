import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.teal,
      fontFamily: GoogleFonts.lato().fontFamily,
      cardColor: Colors.black,
      canvasColor: creameColor,
      buttonColor: darkBlueColor,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreameColor,
      appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme));

  // Colors
  static Color creameColor = Color.fromARGB(255, 255, 252, 252);
  static Color darkCreameColor = Vx.gray800;
  static Color darkBlueColor = Color(0xff403b58);
  static Color lightBlueColor = Vx.purple300;
}
