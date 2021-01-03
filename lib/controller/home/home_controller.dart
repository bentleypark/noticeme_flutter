import 'dart:ui';
import 'package:get/get.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';

class HomeController extends GetxController {
  NoticemeProvider provider = Get.put(NoticemeProvider());

  Color colorFromHex(String hexColor) {
    return provider.colorFromHex(hexColor);
  }
}
