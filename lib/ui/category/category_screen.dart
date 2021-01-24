import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/ui/category/category.dart';
import 'package:noticemeflutter/widget/category_app_bar.dart';
import 'package:noticemeflutter/widget/category_tile.dart';

class CategoryScreen extends StatelessWidget {
  var categoryList = [
    Category('욕실', 'images/category_bath.svg'),
    Category('주방', 'images/category_kitchen.svg'),
    Category('개인위생', 'images/category_personal_hygiene.svg'),
    Category('침실', 'images/category_bedroom.svg'),
    Category('나의 목록', 'images/category_user_custom.svg'),
  ];

  NoticemeProvider provider = Get.put(NoticemeProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: provider.colorFromHex(HOME_SCREEN_BACKGROUND_COLOR),
      appBar: CategoryAppBar(),
      body: Stack(children: [
        Padding(
          padding: EdgeInsets.only(top: 50, left: 10, right: 10),
          child: GridView.count(
            crossAxisCount: 3,
            children:
                List.generate(5, (index) => CategoryTile(categoryList[index])),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: FloatingActionButton(
              onPressed: () {
                // Get.toNamed(Routes.CATEGORY);
              },
              child: Icon(Icons.add),
              backgroundColor:
                  provider.colorFromHex(HOME_SCREEN_FLOATING_BUTTON_COLOR),
            ),
          ),
        )
      ]),
    );
  }
}
