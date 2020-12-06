import 'package:flutter/material.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../getit.dart';

class SplashScreen extends StatelessWidget {
  final provider = getIt<NoticemeProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              provider.colorFromHex("#3cd6e0"),
              provider.colorFromHex("#3cd6e0"),
              provider.colorFromHex("#acefe3")
            ],
          ),
        ),
        child: Stack(
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
        ),
      ),
    );
  }
}
