import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:noticemeflutter/controller/guide/guide_detail_controller.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:noticemeflutter/utils/routes.dart';
import 'package:websafe_svg/websafe_svg.dart';

class GuideDetailScreen extends StatelessWidget {
  final int currentPage;

  NoticemeProvider provider = Get.put(NoticemeProvider());

  GuideDetailScreen({this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<GuideDetailController>(
        init: GuideDetailController(),
        builder: (controller) {
          return Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      controller.getCurrentGuideImage(currentPage),
                    ),
                  ),
                ), // fit: BoxFit.fill,
              ),
              Visibility(
                visible: controller.checkPage(currentPage),
                child: Container(
                  alignment: Alignment(0.0, 0.85),
                  child: MaterialButton(
                    child: WebsafeSvg.asset(
                      'images/btn_start.svg',
                      width: 218,
                      height: 67,
                    ),
                    onPressed: () {
                      controller.setGuideScreenShowed();
                      Get.offNamed(Routes.HOME);
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
