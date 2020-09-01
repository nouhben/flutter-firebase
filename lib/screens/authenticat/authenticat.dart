import 'package:flutter/material.dart';
import 'package:please_work/screens/authenticat/register/register_screen.dart';
import 'package:please_work/screens/authenticat/signin/sign_in_screen.dart';

class Authenticat extends StatefulWidget {
  @override
  _AuthenticatState createState() => _AuthenticatState();
}

class _AuthenticatState extends State<Authenticat> {
  bool showSignIn = true;
  //This function will be called from either sigin or register
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn
        ? SignInScreen(toggle: toggleView)
        : RegisterScreen(toggle: toggleView);
  }
}
