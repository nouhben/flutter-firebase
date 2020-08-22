import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required List<String> errors,
  })  : _errors = errors,
        super(key: key);

  final List<String> _errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        _errors.length,
        (index) => buildFormErrorText(text: _errors[index]),
      ),
    );
  }

  Row buildFormErrorText({String text}) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/Error.svg', width: 16, height: 16),
        SizedBox(width: 10.0),
        Text(text),
      ],
    );
  }
}
