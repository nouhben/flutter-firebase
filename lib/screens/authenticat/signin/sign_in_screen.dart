import 'package:flutter/material.dart';
import 'package:please_work/screens/authenticat/signin/components/body.dart';

class SignInScreen extends StatelessWidget {
  static final String routeName = "/sign_in";
  final Function toggle;

  const SignInScreen({
    Key key,
    this.toggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
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
