import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/resources/strings.dart';
import 'package:noticemeflutter/screen/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../getit.dart';
import 'homescreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenScreenState createState() => _SplashScreenScreenState();
}

class _SplashScreenScreenState extends State<SplashScreen> {
  NoticemeProvider provider = Get.put(NoticemeProvider());
  SharedPreferences _prefs;

  bool isOnBoardingShowed;

  startTime() async {
    var duration = new Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    if (isOnBoardingShowed) {
      Get.off(HomeScreen());
    } else {
      Get.off(OnBoardingScreen());
    }
  }

  getOnBoardingScreenShowed() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      isOnBoardingShowed = _prefs.getBool(KEY_ONBOARDING) ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    getOnBoardingScreenShowed();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              provider.colorFromHex(SPLASH_COLOR1),
              provider.colorFromHex(SPLASH_COLOR1),
              provider.colorFromHex(SPLASH_COLOR2)
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
