import 'package:flutter/material.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';

class TextWidget extends StatelessWidget {
  TextWidget(this.title);

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: HOME_SCREEN_TEXT_COLOR.parseColor(),
          fontWeight: FontWeight.bold,
          fontSize: 20),
    );
  }
}
