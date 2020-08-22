import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:please_work/size_config.dart';

class CostumeSuffixIcon extends StatelessWidget {
  final String svgName;
  const CostumeSuffixIcon({
    Key key,
    @required this.svgName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 15, 10),
      child: SvgPicture.asset(
        svgName,
        width: 35,
        height: SizeConfig.getProportionateScreenHeight(18),
      ),
    );
  }
}
