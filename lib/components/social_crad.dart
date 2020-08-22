import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:please_work/size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key key,
    @required String image,
    @required this.onPress,
  })  : _image = image,
        super(key: key);

  final String _image;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(
          SizeConfig.getProportionateScreenWidth(12),
        ),
        height: SizeConfig.getProportionateScreenHeight(40),
        width: SizeConfig.getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xfff5f6f9),
        ),
        child: SvgPicture.asset(_image),
      ),
    );
  }
}
