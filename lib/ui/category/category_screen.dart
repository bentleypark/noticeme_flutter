import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/ui/category/category.dart';
import 'package:noticemeflutter/utils/routes.dart';
import 'package:noticemeflutter/widget/category_app_bar.dart';
import 'package:noticemeflutter/widget/category_tile.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var categoryList = [
    Category('욕실', 'images/category_bath.svg'),
    Category('주방', 'images/category_kitchen.svg'),
    Category('개인위생', 'images/category_personal_hygiene.svg'),
    Category('침실', 'images/category_bedroom.svg'),
    Category('나의 목록', 'images/category_user_custom.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR.parseColor(),
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
                Get.toNamed(Routes.ADD_CUSTOM);
              },
              child: Icon(Icons.add),
              backgroundColor: HOME_SCREEN_FLOATING_BUTTON_COLOR.parseColor(),
            ),
          ),
        )
      ]),
    );
  }
}
