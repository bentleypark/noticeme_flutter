import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/ui/category/category.dart';
import 'package:noticemeflutter/utils/routes.dart';
import 'package:websafe_svg/websafe_svg.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile(this.category);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.CATEGORY_DETAIL, arguments: category.title);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: WebsafeSvg.asset(
                  category.image,
                  width: 50,
                  height: 50,
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(3.0), child: Text(category.title)),
            ],
          ),
        ),
      ),
    );
  }
}
