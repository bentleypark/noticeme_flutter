import 'package:flutter/material.dart';

import 'noticeme_text_widget.dart';

class UpperTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 80, 0),
        child: TextWidget('교체 주기'),
      ),
    );
  }
}
