import 'package:flutter/widgets.dart';
import 'package:please_work/screens/authenticat/register/register_screen.dart';
import 'package:please_work/screens/authenticat/signin/sign_in_screen.dart';
import 'package:please_work/screens/home/home_screen.dart';
import 'package:please_work/screens/wrapper.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => Wrapper(),
  SignInScreen.routeName: (context) => SignInScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
