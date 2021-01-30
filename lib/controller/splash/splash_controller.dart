import 'dart:async';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:noticemeflutter/resources/strings.dart';
import 'package:noticemeflutter/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  SplashController() {
    startTime();
  }

  SharedPreferences _prefs;
  var isOnBoardingShowed = false;

  checkIsOnBoardingScreenShowed() async {
    _prefs = await SharedPreferences.getInstance();
    isOnBoardingShowed = _prefs.getBool(KEY_ONBOARDING) ?? false;

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
}
