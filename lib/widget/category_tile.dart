import 'package:flutter/material.dart';
import 'package:noticemeflutter/ui/category/category.dart';
import 'package:websafe_svg/websafe_svg.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile(this.category);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  print("onTap called.");
                },
                child: WebsafeSvg.asset(
                  category.image,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(3.0), child: Text(category.title)),
        ],
      ),
    );
  }
}
