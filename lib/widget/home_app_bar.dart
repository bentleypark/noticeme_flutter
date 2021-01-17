import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:websafe_svg/websafe_svg.dart';

// ignore: must_be_immutable
class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  NoticemeProvider provider = Get.put(NoticemeProvider());

  HomeAppBar()
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
              color: provider.colorFromHex('#abdfeb').withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: WebsafeSvg.asset(
                  'images/main_logo.svg',
                  width: 150,
                  height: 25,
                ),
              ),
            ),
            Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  print("onTap called.");
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: WebsafeSvg.asset(
                      'images/btn_setting.svg',
                      width: 45,
                      height: 45,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
