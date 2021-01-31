import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';

// ignore: must_be_immutable
class DashLineBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
              padding: EdgeInsets.only(left: constraints.maxWidth * 0.05),
              child: Dash(
                direction: Axis.horizontal,
                dashBorderRadius: 2,
                dashThickness: 3,
                length: constraints.maxWidth * 0.9,
                dashColor: HOME_SCREEN_DOTTED_LINE_COLOR.parseColor(),
              ));
        }),
        Row(
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Padding(
                  padding: EdgeInsets.only(left: displayWidth(context) * 0.05),
                  child: Dash(
                    direction: Axis.vertical,
                    dashBorderRadius: 2,
                    dashThickness: 3,
                    length: 85,
                    dashColor: HOME_SCREEN_DOTTED_LINE_COLOR.parseColor(),
                  ),
                );
              },
            ),
            Spacer(),
            Text(
              '소모품 리스트가 비었습니다.',
              style: TextStyle(
                  color: HOME_SCREEN_DOTTED_LINE_COLOR.parseColor(),
                  fontSize: 18),
            ),
            Spacer(),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Padding(
                  padding: EdgeInsets.only(right: displayWidth(context) * 0.05),
                  child: Dash(
                    direction: Axis.vertical,
                    dashBorderRadius: 2,
                    dashThickness: 3,
                    length: 85,
                    dashColor: HOME_SCREEN_DOTTED_LINE_COLOR.parseColor(),
                  ),
                );
              },
            ),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Dash(
                direction: Axis.horizontal,
                dashBorderRadius: 2,
                dashThickness: 3,
                length: constraints.maxWidth * 0.9,
                dashColor: HOME_SCREEN_DOTTED_LINE_COLOR.parseColor(),
              );
            },
          ),
        )
      ],
    );
  }
}
