import 'package:flutter/material.dart';
import 'package:please_work/constants.dart';

class NoAccountText extends StatelessWidget {
  final String text1;
  final String text2;
  final Function onPress;
  const NoAccountText({
    Key key,
    this.text1,
    this.text2,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text1,
              style: TextStyle(
                fontSize: 16,
                color: kTextColor,
              ),
            ),
            TextSpan(
              text: text2,
              style: TextStyle(
                fontSize: 18,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
