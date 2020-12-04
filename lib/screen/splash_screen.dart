import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          color: _colorFromHex("#3cd6e0"),
          child: WebsafeSvg.asset(
            'images/logo.svg',
            alignment: Alignment.center,
            width: 177,
            height: 115,
          ),
        )
      ],
    );
  }
}

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
