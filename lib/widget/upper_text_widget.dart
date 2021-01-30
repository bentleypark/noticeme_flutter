import 'package:flutter/material.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';

class UpperTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 80, 0),
        child: Text(
          '다음 교체',
          style: TextStyle(
              color: HOME_SCREEN_TEXT_COLOR.parseColor(),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
    );
  }
}
