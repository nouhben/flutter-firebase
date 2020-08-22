import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xffff7643);
const Color kPrimaryLightColor = Color(0xffffECDf);
const Color kSeconaryColor = Color(0xff979797);
const Color kTextColor = Color(0xff757575);

const Duration kAnimationDuration = Duration(milliseconds: 200);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xffFFA53E),
    Color(0xffFF7643),
  ],
);

//FORM ERRORs
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.-_]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid email";
const String kPassNullError = "Please Enter your password";
const String kshortPassError = "Password too short";
const String kMatchPassError = "Passwords do not match";
