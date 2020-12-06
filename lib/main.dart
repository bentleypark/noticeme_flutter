import 'package:flutter/material.dart';
import 'package:noticemeflutter/getit.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:noticemeflutter/screen/splash_screen.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final provider = getIt<NoticemeProvider>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noticeme',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
