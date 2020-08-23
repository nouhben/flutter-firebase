import 'package:flutter/material.dart';
import 'package:please_work/components/no_account_text.dart';
import 'package:please_work/components/social_crad.dart';
import 'package:please_work/screens/authenticat/register/register_screen.dart';
import 'package:please_work/screens/authenticat/signin/components/sign_in_form.dart';
import 'package:please_work/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('rebuilding ========+===> Body');
    SizeConfig.init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.getProportionateScreenWidth(20),
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
                    fontSize: SizeConfig.getProportionateScreenWidth(28),
                  ),
                ),
                Text(
                  'Sign in with email and password\nor continue with social media',
                  textAlign: TextAlign.center,
                ),
                //SizeConfig.screenHeight * 0.08
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                //
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialCard(
                      image: 'assets/icons/facebook-2.svg',
                      onPress: () {},
                    ),
                    SocialCard(
                      image: 'assets/icons/google-icon.svg',
                      onPress: () {},
                    ),
                    SocialCard(
                      image: 'assets/icons/twitter.svg',
                      onPress: () {},
                    ),
                  ],
                ),

                SizedBox(height: SizeConfig.screenHeight * 0.04),
                NoAccountText(
                  text1: 'Don\'t have an account?',
                  text2: 'Register',
                  onPress: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
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
