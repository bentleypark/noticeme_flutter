import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:noticemeflutter/widget/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NoticemeProvider provider = Get.put(NoticemeProvider());

  @override
  Widget build(BuildContext context) {

    FlutterStatusbarcolor.setStatusBarColor(provider.colorFromHex('#4C676B'));

    return Scaffold(
      backgroundColor: provider.colorFromHex('#f4f9ff'),
      appBar: HomeAppBar(),
    );
  }
}
