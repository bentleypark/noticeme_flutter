import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/controller/home/home_controller.dart';
import 'package:noticemeflutter/data/db/user_consumable_entity.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/utils/routes.dart';
import 'package:noticemeflutter/widget/home_app_bar.dart';
import 'package:noticemeflutter/widget/dash_line_box.dart';
import 'package:noticemeflutter/widget/upper_text_widget.dart';
import 'package:noticemeflutter/widget/userconsumable_tile.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';

class HomeScreen extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(STATUS_BAR_COLOR.parseColor());

    this.context = context;

    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR.parseColor(),
      appBar: HomeAppBar(),
      body: Container(
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return Stack(
              children: [
                UpperTextWidget(),
                FutureBuilder<List<UserConsumableEntity>>(
                    future: controller.getUserConsumableList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.hasData);
                        return Padding(
                          padding:
                              EdgeInsets.only(top: 80, left: 10, right: 10),
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: UserConsumableTile(snapshot.data[index]),
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: DashLineBox(),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              SPLASH_COLOR1.parseColor()),
                          strokeWidth: 3,
                        ),
                      );
                    }),
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
          },
        ),
      ),
    );
  }
}
