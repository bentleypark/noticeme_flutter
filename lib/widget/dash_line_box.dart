import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';

// ignore: must_be_immutable
class DashLineBox extends StatelessWidget {
  NoticemeProvider provider = NoticemeProvider();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: displayWidth(context) * 0.05),
          child: Dash(
            direction: Axis.horizontal,
            dashBorderRadius: 2,
            dashThickness: 3,
            length: displayWidth(context) * 0.88,
            dashColor: provider.colorFromHex(HOME_SCREEN_DOTTED_LINE_COLOR),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: displayWidth(context) * 0.05),
              child: Dash(
                direction: Axis.vertical,
                dashBorderRadius: 2,
                dashThickness: 3,
                length: 85,
                dashColor: provider.colorFromHex(HOME_SCREEN_DOTTED_LINE_COLOR),
              ),
              // ),
            ),
            Spacer(),
            Text('소모품 리스트가 비었습니다.',style: TextStyle(color: provider.colorFromHex(HOME_SCREEN_DOTTED_LINE_COLOR), fontSize: 18),),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: displayWidth(context) * 0.05),
              child: Dash(
                  direction: Axis.vertical,
                  dashBorderRadius: 2,
                  dashThickness: 3,
                  length: 90,
                  dashColor:
                      provider.colorFromHex(HOME_SCREEN_DOTTED_LINE_COLOR)),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Dash(
            direction: Axis.horizontal,
            dashBorderRadius: 2,
            dashThickness: 3,
            length: displayWidth(context) * 0.88,
            dashColor: provider.colorFromHex(HOME_SCREEN_DOTTED_LINE_COLOR),
          ),
        ),
      ],
    );
  }
}
