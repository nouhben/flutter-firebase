import 'dart:io';

import 'package:flutter/material.dart';
import 'package:please_work/models/user.dart';
import 'package:please_work/models/user_data.dart';
import 'package:please_work/services/database_service.dart';
import 'package:please_work/shared/constants.dart';
import 'package:please_work/shared/loading.dart';
import 'package:please_work/shared/size_config.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];
  final _formKey = GlobalKey<FormState>();

  String _currentName;
  String _currentSugars;
  int _currnetStrength = 100;
  @override
  Widget build(BuildContext context) {
    final _loggedInUser = Provider.of<CustomUser>(context);
    final DatabaseService _databaseService =
        DatabaseService(uid: _loggedInUser.uid);
    return StreamBuilder<UserData>(
      stream: _databaseService.userData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Loading();
        } else {
          UserData userData = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Update your Brew Settings'),
                Spacer(),
                SizedBox(height: getProportionateScreenHeight(16)),
                TextFormField(
                  onChanged: (value) => setState(() => _currentName = value),
                  onSaved: (value) => _currentName = value,
                  validator: (value) =>
                      value.isEmpty ? 'Enter your name' : null,
                  initialValue: _currentName ?? userData.name,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    labelText: "Name",
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(36)),
                //Dorpdowan
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(right: 30.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://img.icons8.com/ultraviolet/40/000000/sugar-cubes.png'),
                          fit: BoxFit.scaleDown,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kPrimaryColor
                              .withOpacity((userData.strength * 0.75) / 900),
                          width: 3.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: getProportionateScreenWidth(200),
                        child: DropdownButtonFormField(
                          isDense: true,
                          hint: Text('Sugars'),
                          value: _currentSugars ?? userData.sugars,
                          items: this
                              .sugars
                              .map(
                                (sugar) => DropdownMenuItem(
                                  child: Text('$sugar sugars'),
                                  value: sugar, //this is the selected value
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _currentSugars = value),
                          onSaved: (value) => _currentSugars = value,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(36)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(right: 30.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://img.icons8.com/fluent/48/000000/coffee-beans-.png',
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                        color:
                            Colors.brown[_currnetStrength ?? userData.strength],
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        min: 100,
                        max: 900,
                        activeColor:
                            Colors.brown[_currnetStrength ?? userData.strength],
                        inactiveColor:
                            Colors.brown[_currnetStrength ?? userData.strength],
                        label: 'Strength',
                        value:
                            (_currnetStrength ?? userData.strength).toDouble(),
                        divisions: 8,
                        onChanged: (val) {
                          setState(() {
                            _currnetStrength = val.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Spacer(),
                RaisedButton(
                  color: kPrimaryColor,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      await _databaseService.updateUserData(
                        name: _currentName,
                        strength: _currnetStrength,
                        sugars: _currentSugars,
                      );
                      sleep(Duration(seconds: 1));
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Update', style: TextStyle(color: Colors.white)),
                ),
                //SizedBox(height: 5.0),
              ],
            ),
          );
        }
      },
    );
  }
}
