import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/controller/guide/guide_controller.dart';

import 'onboarding_detail_screen.dart';

class GuidePage extends GetView<GuideController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetX<GuideController>(
          builder: (_) {
            _.insertInitialData();
            return PageView(
              physics: ClampingScrollPhysics(),
              controller: _.pageController,
              onPageChanged: (int page) {
                _.currentPage = page;
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
