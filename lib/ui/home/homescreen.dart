import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/controller/home/home_controller.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/widget/home_app_bar.dart';
import 'package:noticemeflutter/widget/dash_line_box.dart';

class HomeScreen extends GetView<HomeController> {
  NoticemeProvider provider = Get.put(NoticemeProvider());

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(
        provider.colorFromHex(STATUS_BAR_COLOR));

    return Scaffold(
      backgroundColor: provider.colorFromHex(HOME_SCREEN_BACKGROUND_COLOR),
      appBar: HomeAppBar(),
      body: Container(
        child: GetX<HomeController>(
          builder: (controller) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 100, 0),
                    child: Text(
                      '다음 교체',
                      style: TextStyle(
                          color: provider.colorFromHex(HOME_SCREEN_TEXT_COLOR),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: controller.currentListLength == 0
                      ? DashLineBox()
                      : Container(),
                ),
                Center(
                    child: controller.isLoadingData
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(controller
                                .colorFromHex(SPLASH_COLOR1)),
                            strokeWidth: 3,
                          )
                        : Container())
              ],
            );
          },
        ),
      ),
    );
  }
}
