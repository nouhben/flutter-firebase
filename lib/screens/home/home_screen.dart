import 'package:flutter/material.dart';
import 'package:please_work/components/default_button.dart';
import 'package:please_work/constants.dart';
import 'package:please_work/services/authentication_service.dart';
import 'package:please_work/size_config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          SizedBox(
            width: SizeConfig.getProportionateScreenWidth(150.0),
            child: DefaultButton(
              text: 'Sign out',
              color: kPrimaryColor,
              press: () async {
                AuthService _authService = AuthService();
                await _authService.signOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}