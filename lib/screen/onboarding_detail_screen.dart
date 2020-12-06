

import 'package:flutter/cupertino.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../getit.dart';

class OnBoardingDetailScreen extends StatefulWidget {

  final int currentPage;

 OnBoardingDetailScreen({this.currentPage});

  @override
  _OnBoardingDetailScreenState createState() => _OnBoardingDetailScreenState();
}

class _OnBoardingDetailScreenState extends State<OnBoardingDetailScreen> {

  final provider = getIt<NoticemeProvider>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Container(
              height: double.infinity,
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(provider.getCurrentGuideImage(widget.currentPage)),
              ),
              // fit: BoxFit.fill,
            )),
        Container(
          alignment: Alignment(0.0, 0.92),
          child: WebsafeSvg.asset(
            provider.getCurrentGuideDotImage(widget.currentPage),
            width: 260,
            height: 4,
          ),
        )
      ],
    );
  }
}