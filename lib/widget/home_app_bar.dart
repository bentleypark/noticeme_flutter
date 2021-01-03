import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:websafe_svg/websafe_svg.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  NoticemeProvider provider = Get.put(NoticemeProvider());

  HomeAppBar()
      : preferredSize = Size.fromHeight(80.0),
        super();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  // topLeft: Radius.circular(10),
                  // topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: provider.colorFromHex('#abdfeb').withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 10.0),
                  child: WebsafeSvg.asset(
                    'images/main_logo.svg',
                    width: 150,
                    height: 25,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      print("onTap called.");
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(right: 10.0),
                      child: WebsafeSvg.asset(
                        'images/btn_setting.svg',
                        width: 45,
                        height: 45,
                      ),
                    ))
              ],
            ),
          ),
        ));

    //   AppBar(
    //   backgroundColor: Colors.white,
    //   shadowColor: provider.colorFromHex('#abdfeb'),
    // );
  }
}
