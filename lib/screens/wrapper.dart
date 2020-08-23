import 'package:flutter/material.dart';
import 'package:please_work/models/user.dart';
import 'package:please_work/screens/authenticat/authenticat.dart';
import 'package:please_work/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _usr = Provider.of<CustomUser>(context);
    if (_usr == null) {
      return Authenticat();
    }
    return HomeScreen();
  }
}
