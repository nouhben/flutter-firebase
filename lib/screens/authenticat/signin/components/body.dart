import 'package:flutter/material.dart';
import 'package:please_work/components/default_button.dart';
import 'package:please_work/components/no_account_text.dart';
import 'package:please_work/screens/authenticat/register/register_screen.dart';
import 'package:please_work/screens/authenticat/signin/components/sign_in_form.dart';
import 'package:please_work/services/authentication_service.dart';
import 'package:please_work/shared/constants.dart';
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
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(28),
                  ),
                ),
                Text(
                  'Sign in with email and password',
                  textAlign: TextAlign.center,
                ),
                //SizeConfig.screenHeight * 0.08
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                DefaultButton(
                  text: 'Sign in with Google',
                  color: kPrimaryColor,
                  press: () async {
                    AuthService().signInWithGoogle().then((user) {
                      if (user != null) {
                        print('Signed in success with Google: ${user.name}');
                        Navigator.pushNamed(context, 'home');
                      }
                    });
                  },
                ),
                NoAccountText(
                  text1: 'Don\'t have an account? ',
                  text2: 'Register',
                  onPress: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => RegisterScreen(),
                    //   ),
                    // );
                    //this.toggleView();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(
                          toggle: () {},
                        ),
                      ),
                    );
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
/*

*/
