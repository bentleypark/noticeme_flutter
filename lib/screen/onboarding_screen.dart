import 'package:flutter/material.dart';
import 'package:noticemeflutter/screen/onboarding_detail_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

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
