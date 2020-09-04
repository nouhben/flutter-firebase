import 'package:flutter/material.dart';
import 'package:please_work/models/brew.dart';
import 'package:please_work/screens/home/components/brew_list.dart';
import 'package:please_work/services/authentication_service.dart';
import 'package:please_work/services/database_service.dart';
import 'package:please_work/shared/constants.dart';
import 'package:please_work/shared/size_config.dart';
import 'package:provider/provider.dart';

import 'components/settings_form.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();
  static final String routeName = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
          actions: [
            IconButton(
              icon: Icon(Icons.low_priority),
              onPressed: () async {
                await _authService.signOut();
              },
            ),
            FlatButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    elevation: 16.0,
                    enableDrag: true,
                    isDismissible: true,
                    //barrierColor: Colors.transparent,

                    context: context,
                    builder: (context) => Container(
                      padding: EdgeInsets.all(20),
                      constraints:
                          BoxConstraints(maxWidth: SizeConfig.screenWidth * 90),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: SettingsForm(),
                    ),
                  );
                },
                icon: Icon(Icons.settings),
                label: Text('Settongs'))
          ],
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: BrewList(),
          ),
        ),
      ),
    );
  }
}
