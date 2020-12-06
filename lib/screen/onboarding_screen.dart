import 'package:flutter/material.dart';
import 'package:noticemeflutter/screen/onboarding_detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  SharedPreferences _prefs;
  String onBoardingKey = 'onBoarding';

  setCounterToSharedPrefs(bool state) async {
    // 카운터를 저장한다. string 을 저장할경우 setString 등을 사용할 수 있습니다.
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool(onBoardingKey, state);
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
        child: PageView(
          physics: ClampingScrollPhysics(),
          controller: _pageController,
          onPageChanged: (int page) {
            setState(
              () {
                _currentPage = page;
              },
            );
          },
          children: [
            OnBoardingDetailScreen(
              currentPage: _currentPage,
            ),
            OnBoardingDetailScreen(
              currentPage: _currentPage,
            ),
            OnBoardingDetailScreen(
              currentPage: _currentPage,
            ),
            OnBoardingDetailScreen(
              currentPage: _currentPage,
            )
          ],
        ),
      ),
    );
  }
}
