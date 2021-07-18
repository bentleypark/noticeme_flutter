import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/controller/home/home_controller.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';
import 'package:noticemeflutter/utils/routes.dart';
import 'package:noticemeflutter/widget/home_app_bar.dart';
import 'package:noticemeflutter/widget/upper_text_widget.dart';
import 'package:noticemeflutter/widget/userconsumable_tile.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(STATUS_BAR_COLOR.parseColor());

    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR.parseColor(),
      appBar: HomeAppBar(),
      body: Container(
        child: GetX<HomeController>(initState: (state) {
          Get.find<HomeController>().getUserConsumableList();
        }, builder: (_) {
          return Stack(
            children: [
              UpperTextWidget(),
              _.userConsumableList.length < 1
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            SPLASH_COLOR1.parseColor()),
                        strokeWidth: 3,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: 80, left: 10, right: 10),
                      child: ListView.builder(
                        itemCount: _.userConsumableList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child:
                                UserConsumableTile(_.userConsumableList[index]),
                          );
                        },
                      ),
                    ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: FloatingActionButton(
                    onPressed: () {
                      Get.toNamed(Routes.CATEGORY);
                    },
                    child: Icon(Icons.add),
                    backgroundColor:
                        HOME_SCREEN_FLOATING_BUTTON_COLOR.parseColor(),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
