import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:please_work/constants.dart';

ThemeData myAppThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: GoogleFonts.muli().fontFamily,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.white,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline6: TextStyle(color: Color(0xff8b8b8b), fontSize: 18.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 10.0,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 10.0,
      ),
    ),
  );
}
