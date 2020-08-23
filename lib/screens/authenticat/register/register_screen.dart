import 'package:flutter/material.dart';
import 'package:please_work/screens/authenticat/register/components/body.dart';

class RegisterScreen extends StatelessWidget {
  static final String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Body(),
    );
  }
}
