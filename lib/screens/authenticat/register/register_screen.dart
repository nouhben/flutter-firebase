import 'package:flutter/material.dart';
import 'package:please_work/screens/authenticat/register/components/body.dart';

class RegisterScreen extends StatelessWidget {
  static final String routeName = "/sign_up";
  final Function toggle;

  const RegisterScreen({
    Key key,
    this.toggle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: this.toggle,
          ),
        ],
      ),
      body: Body(),
    );
  }
}
