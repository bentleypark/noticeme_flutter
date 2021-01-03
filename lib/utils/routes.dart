import 'package:get/get.dart';
import 'package:noticemeflutter/binding/guide_binding.dart';
import 'package:noticemeflutter/ui/home/homescreen.dart';
import 'package:noticemeflutter/ui/onboarding/guide_screen.dart';
import 'package:noticemeflutter/ui/splash/splash_screen.dart';
import 'package:sqlite_viewer/sqlite_viewer.dart';

routes() => [
      GetPage(
        name: Routes.SPLASH,
        page: () => SplashScreen(),
      ),
      GetPage(
          name: Routes.GUIDE,
          page: () => GuideScreen(),
          binding: GuideBinding()),
      GetPage(
        name: Routes.HOME,
        page: () => HomeScreen(),
      ),
      GetPage(
        name: Routes.DB,
        page: () => DatabaseList(),
      )
    ];

abstract class Routes {
  static const SPLASH = '/splash';
  static const GUIDE = '/guide';
  static const HOME = '/home';
  static const DB = '/db';
}
