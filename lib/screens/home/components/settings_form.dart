import 'package:flutter/material.dart';
import 'package:please_work/shared/constants.dart';
import 'package:please_work/shared/size_config.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];
  final GlobalKey _formKey = GlobalKey<FormState>();

  String _currentName;
  String _currentSugars = '0';
  int _currnetStrength;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Update your Brew Settings'),
          SizedBox(height: getProportionateScreenHeight(16)),
          TextFormField(
            onChanged: (value) => setState(() => _currentName = value),
            validator: (value) => value.isEmpty ? 'Enter your name' : null,
            decoration: InputDecoration(
              hintText: 'Enter your name',
              labelText: "Name",
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(16)),
          //Dorpdowan
          SizedBox(
            width: getProportionateScreenWidth(200),
            child: DropdownButtonFormField(
              isDense: true,
              hint: Text('Sugars'),
              items: this
                  .sugars
                  .map(
                    (sugar) => DropdownMenuItem(
                      child: Text('$sugar sugars'),
                      value: sugar, //this is the selected value
                      // onTap: () {
                      //   setState(() {
                      //     _currentSugars = sugar;
                      //   });
                      // },
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() => _currentSugars = value),
            ),
          ),
          //Slider
          RaisedButton(
            color: kPrimaryColor,
            onPressed: () async {
              print('$_currentName: $_currentSugars and $_currnetStrength');
            },
            child: Text('Update', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
