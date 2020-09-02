import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:please_work/components/default_button.dart';
import 'package:please_work/constants.dart';
import 'package:please_work/services/authentication_service.dart';
import 'package:please_work/services/database_service.dart';
import 'package:please_work/size_config.dart';
import 'package:provider/provider.dart';

// class _HomeScreenState extends State<HomeScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<QuerySnapshot>.value(
//       value: DatabaseService().userSettings,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('HOME'),
//         ),
//         body: Body(authService: _authService),
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();
  static final String routeName = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().userSettings,
      child: Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
        ),
        body: Body(authService: this._authService),
      ),
    );
  }
}

class UserSettingsList extends StatefulWidget {
  @override
  _UserSettingsListState createState() => _UserSettingsListState();
}

class _UserSettingsListState extends State<UserSettingsList> {
  @override
  Widget build(BuildContext context) {
    final settingsList = Provider.of<QuerySnapshot>(context);
    return Column(
      children: List.generate(
        settingsList.docs.length,
        (index) => Text(
          settingsList.docs[index].data().toString(),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required AuthService authService,
  })  : _authService = authService,
        super(key: key);

  final AuthService _authService;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          UserSettingsList(),
          Spacer(),
          SizedBox(
            width: SizeConfig.getProportionateScreenWidth(150.0),
            child: DefaultButton(
              text: 'Sign out',
              color: kPrimaryColor,
              press: () async {
                await _authService.signOut();
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
