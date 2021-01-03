
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/controller/guide/guide_controller.dart';

import 'onboarding_detail_screen.dart';

class GuideScreen extends GetView<GuideController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetX<GuideController>(
          builder: (controller){
            controller.insertInitialData();
            return PageView(
              physics: ClampingScrollPhysics(),
              controller: controller.pageController,
              onPageChanged: (int page) {
                // setState(
                //       () {
                print("current page: $page");
                controller.currentPage = page;
                //   },
                // );
              },
              children: [
                OnBoardingDetailScreen(
                  currentPage: controller.currentPage,
                ),
                OnBoardingDetailScreen(
                  currentPage: controller.currentPage,
                ),
                OnBoardingDetailScreen(
                  currentPage: controller.currentPage,
                ),
                OnBoardingDetailScreen(
                  currentPage: controller.currentPage,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}