import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment(0.0, -0.3),
          child: WebsafeSvg.asset(
            'images/logo.svg',
            width: 177,
            height: 115,
          ),
        ),
        Container(
          alignment: Alignment(-0.5, 0.2),
          child: WebsafeSvg.asset(
            'images/splash_text1.svg',
            width: 255,
            height: 55,
          ),
        ),
        Container(
          alignment: Alignment(-0.5, 0.5),
          child: WebsafeSvg.asset(
            'images/splash_text2.svg',
            width: 166,
            height: 78,
          ),
        )
      ],
    );
  }
}
