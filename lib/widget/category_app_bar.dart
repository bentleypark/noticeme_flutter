import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:websafe_svg/websafe_svg.dart';

class CategoryAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  NoticemeProvider provider = Get.put(NoticemeProvider());

  CategoryAppBar()
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
              color:
                  provider.colorFromHex(APP_BAR_SHADOW_COLOR).withOpacity(0.5),
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
                    print("onTap called.");
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
          Text(
            '카테고리',
            style: TextStyle(
                fontSize: 20,
                color: provider.colorFromHex(APP_BAR_TITLE_COLOR)),
          ),
          Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    print("onTap called.");
                  },
                  child: WebsafeSvg.asset(
                    'images/btn_search.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
