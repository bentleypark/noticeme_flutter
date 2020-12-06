import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';

import '../getit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final provider = getIt<NoticemeProvider>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: provider.colorFromHex('#f4f9ff'),);
  }
}
