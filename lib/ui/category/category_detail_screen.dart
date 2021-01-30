import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/controller/category/category_detail_controller.dart';
import 'package:noticemeflutter/data/db/consumable_entity.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';
import 'package:noticemeflutter/widget/cartegory_detail_app_bar.dart';
import 'package:noticemeflutter/widget/consumable_tile.dart';
import 'package:noticemeflutter/widget/dash_line_box.dart';
import 'package:noticemeflutter/widget/upper_text_widget.dart';

class CategoryDetailScreen extends StatelessWidget {
  var title = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR.parseColor(),
      appBar: CategoryDetailAppBar(title),
      body: Container(
        child: GetBuilder<CategoryDetailController>(
          builder: (controller) {
            return Stack(
              children: [
                UpperTextWidget(),
                FutureBuilder<List<ConsumableEntity>>(
                    future: controller.fetchConsumableByCategory(title),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data.length);
                        return Padding(
                          padding:
                              EdgeInsets.only(top: 80, left: 10, right: 10),
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ConsumableTile(snapshot.data[index]),
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
              ],
            );
          },
        ),
      ),
    );
  }
}
