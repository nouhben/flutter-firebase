import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:please_work/models/user.dart';
import 'package:please_work/screens/wrapper.dart';
import 'package:please_work/services/authentication_service.dart';
import 'package:please_work/shared/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
      value: AuthService().user, //the stream we are listening to
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: themeData(context),
        darkTheme: darkThemeData(context),
        home: Wrapper(),
      ),
    );
  }
}
