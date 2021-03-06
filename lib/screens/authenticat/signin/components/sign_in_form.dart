import 'package:flutter/material.dart';
import 'package:please_work/components/costume_suffix_icon.dart';
import 'package:please_work/components/default_button.dart';
import 'package:please_work/components/form_error.dart';
import 'package:please_work/shared/constants.dart';
import 'package:please_work/services/authentication_service.dart';
import 'package:please_work/shared/loading.dart';
import 'package:please_work/shared/size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  String email;
  String password;
  bool rememberMe = false;
  List<String> errors = [];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Form(
            //autovalidate: true,
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth * 0.79,
                  child: buildEmailFormField(),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                SizedBox(
                  width: SizeConfig.screenWidth * 0.79,
                  child: buildPasswordFormField(),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                Row(
                  // alignment: WrapAlignment.center,
                  // crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Checkbox(
                      value: rememberMe,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value;
                        });
                      },
                    ),
                    Text('Remember me'),
                    Spacer(),
                    MaterialButton(
                      onPressed: () async {
                        // Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                      },
                      child: Text(
                        'Forget Password',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                FormError(errors: errors),
                SizedBox(height: getProportionateScreenHeight(20)),
                DefaultButton(
                  text: 'Continue',
                  color: kPrimaryColor,
                  press: () async {
                    if (_formKey.currentState.validate()) {
                      //_formKey.currentState.save();
                      setState(() {
                        isLoading = true;
                      });
                      //if (errors.isEmpty) {
                      //Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                      // final AuthService _authService = AuthService();
                      dynamic user = await _authService.signInEmailPassword(
                        email: this.email,
                        password: this.password,
                      );
                      print(user); //await _authService.signInAnonymously();
                      if (user == null) {
                        setState(() {
                          this.errors = [];
                          this.errors.add('Could not sign in please checkout');
                          isLoading = false;
                        });
                      }
                      //}
                    }
                  },
                ),
              ],
            ),
          );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        setState(() {
          email = value;
        });
      },
      // validator: (val) => (val.isEmpty || val.length < 6) ? return 'invalid value' : return null,
      onFieldSubmitted: (value) {
        setState(() {
          email = value;
        });
      },

      validator: (value) {
        if (value.isEmpty) {
          return kEmailNullError;
        }
        if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CostumeSuffixIcon(svgName: 'assets/icons/email-icon.svg'),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
      onFieldSubmitted: (value) {
        setState(() {
          password = value;
        });
      },
      validator: (value) {
        if (value.length < 8) return kshortPassError;
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter your password',
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CostumeSuffixIcon(svgName: 'assets/icons/password-icon.svg'),
      ),
    );
  }
}
