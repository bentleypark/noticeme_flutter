import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/resources/colors.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';
import 'package:noticemeflutter/widget/cartegory_detail_app_bar.dart';

class CategoryDetailScreen extends StatelessWidget {
  var title = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR.parseColor(),
      appBar: CategoryDetailAppBar(title),
      body: Stack(),
    );
  }
}
