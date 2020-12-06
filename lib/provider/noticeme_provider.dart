import 'package:flutter/material.dart';

class NoticemeProvider {
  Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  String getCurrentGuideImage(int currentPage) {
    switch (currentPage) {
      case 0:
        return 'images/guide_image1.png';
        break;
      case 1:
        return 'images/guide_image2.png';
        break;
      case 2:
        return 'images/guide_image3.png';
        break;
      case 3:
        return 'images/guide_image4.png';
        break;
    }
  }

  String getCurrentGuideDotImage(int currentPage) {
    switch (currentPage) {
      case 0:
        return 'images/guide_dot_1.svg';
        break;
      case 1:
        return 'images/guide_dot_2.svg';
        break;
      case 2:
        return 'images/guide_dot_3.svg';
        break;
      case 3:
        return 'images/guide_dot_4.svg';
        break;
    }
  }
}
