import 'package:flutter/material.dart';
import 'package:please_work/screens/authenticat/signin/sign_in_screen.dart';

class Authenticat extends StatefulWidget {
  @override
  _AuthenticatState createState() => _AuthenticatState();
}

class _AuthenticatState extends State<Authenticat> {
  @override
  Widget build(BuildContext context) {
    return SignInScreen();
  }
}
