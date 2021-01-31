import 'package:flutter/material.dart';

Size displaySize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}

extension ExtendedColor on String {
  Color parseColor() {
    final hexCode = this.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}

Color parseColor(String hexColor) {
final hexCode = hexColor.replaceAll('#', '');
return Color(int.parse('FF$hexCode', radix: 16));
}

