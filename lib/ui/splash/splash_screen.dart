import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/controller/splash/SplashController.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) {
            return Scaffold(
              body: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      controller.colorFromHex(SPLASH_COLOR1),
                      controller.colorFromHex(SPLASH_COLOR1),
                      controller.colorFromHex(SPLASH_COLOR2)
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
          },
        ),
      ),
    );
  }
}
