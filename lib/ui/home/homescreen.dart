import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  NoticemeProvider provider = Get.put(NoticemeProvider());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: provider.colorFromHex('#f4f9ff'),);
  }
}
