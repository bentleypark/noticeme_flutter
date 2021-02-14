import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/utils/routes.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';

class AddCustomConsumableAppBar extends StatelessWidget
    with PreferredSizeWidget {
  @override
  final Size preferredSize;

  String from;
  Widget button;

  AddCustomConsumableAppBar({@required this.from, this.button})
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
                padding: EdgeInsets.only(left: 16.0),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      if (from == 'AddCustomConsumableScreen') {
                        Get.offNamed(Routes.CATEGORY);
                      } else {
                        Get.offNamed(Routes.HOME);
                      }
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
            Align(
              alignment: Alignment.center,
              child: Text(
                getAppBarTitle(),
                style: TextStyle(
                  fontSize: 20,
                  color: APP_BAR_TITLE_COLOR.parseColor(),
                ),
              ),
            ),
            Visibility(
              child: Padding(
                padding: EdgeInsets.only(
                  right: 30,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: button,
                ),
              ),
              visible: button != null,
            )
          ],
        ),
      ),
    );
  }

  String getAppBarTitle() {
    if (from == 'AddCustomConsumableScreen') {
      return '직접 추가';
    } else {
      return '소모품 수정';
    }
  }
}
