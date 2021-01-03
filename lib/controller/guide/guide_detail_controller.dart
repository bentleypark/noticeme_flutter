
import 'package:get/get.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:noticemeflutter/resources/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuideDetailController extends GetxController {

  NoticemeProvider provider = Get.put(NoticemeProvider());

  String getCurrentGuideImage(int page){
    return provider.getCurrentGuideImage(page);
  }

  bool checkPage(int page) {
    if (page == 3) {
      return true;
    } else {
      return false;
    }
  }

  SharedPreferences _prefs;

  setGuideScreenShowed() async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool(KEY_ONBOARDING, true);
  }
}