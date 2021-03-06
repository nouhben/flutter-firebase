import 'package:flutter/material.dart';
import 'package:please_work/components/no_account_text.dart';
import 'package:please_work/screens/authenticat/register/components/sign_up_form.dart';
import 'package:please_work/screens/authenticat/signin/sign_in_screen.dart';
import 'package:please_work/shared/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(28),
                  ),
                ),
                Text(
                  'Sign up with email and password\nand provide your full name',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                NoAccountText(
                  text1: 'Already have an account? ',
                  text2: 'Sign in',
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                    );
                    //this.toggleView();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
