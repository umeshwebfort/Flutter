import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: GoogleFonts.lato().fontFamily,
        // appBarTheme: AppBarTheme(
        //     color: Colors.white,
        //     elevation: 0.0,
        //     iconTheme: IconThemeData(color: Colors.black),
        //     textTheme: Theme.of(context).textTheme)
        // primaryTextTheme: GoogleFonts.latoTextTheme(),
      );

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);
}
