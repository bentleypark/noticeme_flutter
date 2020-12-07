import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/resources/strings.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../getit.dart';
import 'homescreen.dart';

class OnBoardingDetailScreen extends StatefulWidget {
  final int currentPage;

  OnBoardingDetailScreen({this.currentPage});

  @override
  _OnBoardingDetailScreenState createState() => _OnBoardingDetailScreenState();
}

class _OnBoardingDetailScreenState extends State<OnBoardingDetailScreen> {
  NoticemeProvider provider = Get.find();

  @override
  void initState() {
    super.initState();
    checkPage();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 30, bottom: 10),
          child: Container(
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  provider.getCurrentGuideImage(widget.currentPage),
                ),
              ),
            ), // fit: BoxFit.fill,
          ),
        ),
        Container(
          alignment: Alignment(0.0, 0.92),
          child: WebsafeSvg.asset(
            provider.getCurrentGuideDotImage(widget.currentPage),
            width: 260,
            height: 4,
          ),
        ),
        Visibility(
            visible: checkPage(),
            child: Container(
              alignment: Alignment(0.8, 0.85),
              child: TextButton(
                child: Text(
                  '시작하기',
                  style: TextStyle(
                      color:
                          provider.colorFromHex(ONBOARDING_TEXT_BUTTON_COLOR),
                      fontSize: 18,
                      fontFamily: FONT_NOTOSANS,
                      fontWeight: FontWeight.w700),
                ),
                onPressed: () {
                  Get.off(HomeScreen());
                },
              ),
            ))
      ],
    );
  }

  bool checkPage() {
    if (widget.currentPage == 3) {
      return true;
    } else {
      return false;
    }
  }
}
