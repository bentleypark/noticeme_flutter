import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:noticemeflutter/data/db/consumable_entity.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:noticemeflutter/resources/strings.dart';
import 'package:noticemeflutter/ui/home/homescreen.dart';
import 'package:noticemeflutter/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {

  List<ConsumableEntity> _list;
  ConsumableEntity _entity;

  SplashController() {
    startTime();
  }

  NoticemeProvider provider = Get.put(NoticemeProvider());
  SharedPreferences _prefs;
  var isOnBoardingShowed = false;

  checkIsOnBoardingScreenShowed() async {
    _prefs = await SharedPreferences.getInstance();
    isOnBoardingShowed = _prefs.getBool(KEY_ONBOARDING) ?? false;

    // insertInitialData();

    if (isOnBoardingShowed) {
      Get.offNamed(Routes.HOME);
    } else {
      Get.offNamed(Routes.GUIDE);
    }
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return Timer(duration, checkIsOnBoardingScreenShowed);
  }

  Color colorFromHex(String hexColor) {
    return provider.colorFromHex(hexColor);
  }

  // insertInitialData() => repository.insertConsumable(
  //     ConsumableEntity(0, '칫솔', 'images/img_toothbrush.png', '욕실', 7776000000));

// setUpInitialData() async {
//   _entity = ConsumableEntity(
//       0, '칫솔', 'images/img_toothbrush.png', '욕실', 7776000000);
//   await Future.delayed(Duration(milliseconds: 100));
//   _list.add(_entity);
// }
}