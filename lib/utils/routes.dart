import 'package:get/get.dart';
import 'package:noticemeflutter/ui/home/homescreen.dart';
import 'package:noticemeflutter/ui/onboarding/onboarding_screen.dart';
import 'package:noticemeflutter/ui/splash/splash_screen.dart';

routes() => [
    GetPage(
      name: '/splash',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/onBoarding',
      page: () => OnBoardingScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
    )
  ];

