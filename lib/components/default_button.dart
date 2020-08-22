import 'package:flutter/material.dart';
import 'package:please_work/size_config.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function press;
  const DefaultButton({
    Key key,
    @required this.text,
    @required this.color,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: this.press,
        child: Text(
          this.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.getProportionateScreenWidth(18),
          ),
        ),
        color: this.color,
      ),
    );
  }
}
