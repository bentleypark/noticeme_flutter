import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/controller/home/home_controller.dart';
import 'package:noticemeflutter/data/db/user_consumable_entity.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/widget/home_app_bar.dart';
import 'package:noticemeflutter/widget/dash_line_box.dart';
import 'package:noticemeflutter/widget/userconsumable_tile.dart';

class HomeScreen extends StatelessWidget {
  NoticemeProvider provider = Get.put(NoticemeProvider());

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(
        provider.colorFromHex(STATUS_BAR_COLOR));

    return Scaffold(
      backgroundColor: provider.colorFromHex(HOME_SCREEN_BACKGROUND_COLOR),
      appBar: HomeAppBar(),
      body: Container(
        child: GetBuilder<HomeController>(
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
                              controller.colorFromHex(SPLASH_COLOR1)),
                          strokeWidth: 3,
                        ),
                      );
                    }),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.add),
                      backgroundColor: provider
                          .colorFromHex(HOME_SCREEN_FLOATING_BUTTON_COLOR),
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
