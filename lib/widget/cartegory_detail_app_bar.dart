import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/utils/routes.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';

class CategoryDetailAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  String appBarTitle;

  CategoryDetailAppBar(this.appBarTitle)
      : preferredSize = Size.fromHeight(80.0),
        super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: APP_BAR_SHADOW_COLOR.parseColor().withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    Get.offNamed(Routes.CATEGORY);
                  },
                  child: WebsafeSvg.asset(
                    'images/arrow_back.svg',
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: Text(
              appBarTitle,
              style: TextStyle(
                fontSize: 20,
                color: APP_BAR_TITLE_COLOR.parseColor(),
              ),
            ),
          ),
          Spacer(),
        ]),
      ),
    );
  }
}
