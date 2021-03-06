import 'package:flutter/material.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';
import 'package:websafe_svg/websafe_svg.dart';

// ignore: must_be_immutable
class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

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
              color: APP_BAR_SHADOW_COLOR.parseColor().withOpacity(0.5),
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
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      print("onTap called.");
                    },
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
