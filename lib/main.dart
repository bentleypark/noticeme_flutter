import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:noticemeflutter/data/db/noticeme_database.dart';
import 'package:noticemeflutter/getit.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:noticemeflutter/resources/strings.dart';
import 'package:noticemeflutter/utils/routes.dart';

Future<void> main() async {
  setup();
  initServices();
  runApp(MyApp());
  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn = SENTRY_DNS;
  //   },
  //   appRunner: () => runApp(MyApp()),
  // );

}

initServices() async {
  await Get.putAsync<NoticemeDatabase>(() => NoticemeDatabase.init());
}

class MyApp extends StatelessWidget {
  final provider = getIt<NoticemeProvider>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      getPages: routes(),
      initialRoute: Routes.SPLASH,
      defaultTransition: Transition.fade,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
