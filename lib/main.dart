import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:noticemeflutter/getit.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:noticemeflutter/resources/strings.dart';
import 'package:noticemeflutter/utils/routes.dart';

Future<void> main() async {
  setup();
  runApp(MyApp());
  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn = SENTRY_DNS;
  //   },
  //   appRunner: () => runApp(MyApp()),
  // );

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
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
