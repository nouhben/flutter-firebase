import 'package:flutter/material.dart';
import 'package:please_work/components/costume_suffix_icon.dart';
import 'package:please_work/components/default_button.dart';
import 'package:please_work/components/form_error.dart';
import 'package:please_work/constants.dart';
import 'package:please_work/services/authentication_service.dart';
import 'package:please_work/size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String fullname;
  String password;
  bool rememberMe = false;

  List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            width: SizeConfig.screenWidth * 0.79,
            child: _buildFullNameFormField(),
          ),
          SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
          SizedBox(
            width: SizeConfig.screenWidth * 0.79,
            child: _buildEmailFormField(),
          ),
          SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
          SizedBox(
            width: SizeConfig.screenWidth * 0.79,
            child: _buildPasswordFormField(),
          ),
          SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
          DefaultButton(
            text: 'Register',
            color: kPrimaryColor,
            press: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                if (errors.isEmpty) {
                  //Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                  final AuthService _authService = AuthService();
                  dynamic user =
                      await _authService.registerWithEmailAndPassword(
                    email: this.email,
                    password: this.password,
                  );
                  //await _authService.signInAnonymously();
                  print(user.toString());
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField _buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
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

  TextFormField _buildFullNameFormField() {
    return TextFormField(
      onSaved: (newValue) => fullname = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNameNullError)) {
          setState(() {
            errors.remove(kNameNullError);
          });
        } else if (value.length >= 5 && errors.contains(kshortNameError)) {
          setState(() {
            errors.remove(kshortNameError);
          });
          return "";
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kNameNullError)) {
          setState(() {
            errors.add(kNameNullError);
          });
          return "";
        } else if (value.length < 5 && !errors.contains(kshortNameError)) {
          setState(() {
            errors.add(kshortNameError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: 'Enter your full name',
        labelText: "Full name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CostumeSuffixIcon(svgName: 'assets/icons/User.svg'),
      ),
    );
  }

  TextFormField _buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kshortPassError)) {
          setState(() {
            errors.remove(kshortPassError);
          });
          return "";
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if (value.length < 8 && !errors.contains(kshortPassError)) {
          setState(() {
            errors.add(kshortPassError);
          });
          return "";
        }
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
