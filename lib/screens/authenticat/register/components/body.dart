import 'package:flutter/material.dart';
import 'package:please_work/screens/authenticat/register/components/sign_up_form.dart';
import 'package:please_work/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  'Welcome',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.getProportionateScreenWidth(28),
                  ),
                ),
                Text(
                  'Sign up with email and password\nand provide your full name',
                  textAlign: TextAlign.center,
                ),
                //SizeConfig.screenHeight * 0.08
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
                //
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     SocialCard(
                //       image: 'assets/icons/facebook-2.svg',
                //       onPress: () {},
                //     ),
                //     SocialCard(
                //       image: 'assets/icons/google-icon.svg',
                //       onPress: () {},
                //     ),
                //     SocialCard(
                //       image: 'assets/icons/twitter.svg',
                //       onPress: () {},
                //     ),
                //   ],
                // ),

                //SizedBox(height: SizeConfig.screenHeight * 0.04),
                //NoAccountText(),
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
