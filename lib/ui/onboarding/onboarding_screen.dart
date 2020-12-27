import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/controller/guide/guide_controller.dart';
import 'package:noticemeflutter/resources/strings.dart';
import 'package:noticemeflutter/ui/onboarding/onboarding_detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  SharedPreferences _prefs;

  setCounterToSharedPrefs(bool state) async {
    // 카운터를 저장한다. string 을 저장할경우 setString 등을 사용할 수 있습니다.
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool(KEY_ONBOARDING, state);
  }

  @override
  void initState() {
    super.initState();
    setCounterToSharedPrefs(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetBuilder<GuideController>(
          builder: (_) {
            _.insertInitialData();
            return PageView(
              physics: ClampingScrollPhysics(),
              controller: _.pageController,
              onPageChanged: (int page) {
                setState(
                  () {
                    _.currentPage = page;
                  },
                );
              },
              children: [
                OnBoardingDetailScreen(
                  currentPage: _.currentPage,
                ),
                OnBoardingDetailScreen(
                  currentPage: _.currentPage,
                ),
                OnBoardingDetailScreen(
                  currentPage: _.currentPage,
                ),
                OnBoardingDetailScreen(
                  currentPage: _.currentPage,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
