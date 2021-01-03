import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/controller/guide/guide_controller.dart';
import 'package:noticemeflutter/ui/onboarding/guide_detail_screen.dart';

class GuideScreen extends GetView<GuideController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetX<GuideController>(
          builder: (controller) {
            controller.insertInitialData();
            return PageView(
              physics: ClampingScrollPhysics(),
              controller: controller.pageController,
              onPageChanged: (int page) {
                controller.currentPage = page;
              },
              children: [
                GuideDetailScreen(
                  currentPage: controller.currentPage,
                ),
                GuideDetailScreen(
                  currentPage: controller.currentPage,
                ),
                GuideDetailScreen(
                  currentPage: controller.currentPage,
                ),
                GuideDetailScreen(
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
