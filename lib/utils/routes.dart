import 'package:get/get.dart';
import 'package:noticemeflutter/binding/category_detail_binding.dart';
import 'package:noticemeflutter/binding/guide_binding.dart';
import 'package:noticemeflutter/binding/home_biding.dart';
import 'package:noticemeflutter/ui/category/category_detail_screen.dart';
import 'package:noticemeflutter/ui/category/category_screen.dart';
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
          name: Routes.HOME, page: () => HomeScreen(), binding: HomeBinding()),
      GetPage(
        name: Routes.DB,
        page: () => DatabaseList(),
      ),
      GetPage(
        name: Routes.CATEGORY,
        page: () => CategoryScreen(),
      ),
      GetPage(
          name: Routes.CATEGORY_DETAIL,
          page: () => CategoryDetailScreen(),
          binding: CategoryDetailBinding())
    ];

abstract class Routes {
  static const SPLASH = '/splash';
  static const GUIDE = '/guide';
  static const HOME = '/home';
  static const CATEGORY = '/category';
  static const CATEGORY_DETAIL = '/category_detail';
  static const DB = '/db';
}
