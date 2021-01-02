import 'package:flutter/material.dart';
import 'package:noticemeflutter/data/db/consumable_dao.dart';
import 'package:noticemeflutter/data/db/consumable_entity.dart';
import 'package:noticemeflutter/data/db/noticeme_database.dart';

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

  List<ConsumableEntity> getConsumableList() {
    List<ConsumableEntity> list = [
      ConsumableEntity('칫솔', 'images/img_toothbrush.png', '욕실', 7776000000),
      ConsumableEntity(
          '치간칫솔', 'images/img_interdental_toothbrush.png', '욕실', 604800000),
      ConsumableEntity('샤워타월', 'images/img_shower_towel.png', '욕실', 7776000000),
      ConsumableEntity('수세미', 'images/img_scrubbers.png', '주방', 2592000000),
      ConsumableEntity('행주', 'images/img_dishcloth.png', '주방', 604800000),
      ConsumableEntity('고무장갑', 'images/img_rubber_glove.png', '주방', 7776000000),
      ConsumableEntity('플라스틱용기', 'images/img_plastic.png', '주방', 7776000000),
      ConsumableEntity('면도기', 'images/img_razor.png', '개인위생', 1209600000),
      ConsumableEntity(
          '메이크업브러쉬', 'images/img_makeup_brush.png', '개인위생', 62208000000),
      ConsumableEntity(
          '소프트렌즈', 'images/img_soft_lens.png', '개인위생', 25920000000),
      ConsumableEntity('하드렌즈', 'images/img_hard_lens.png', '개인위생', 62208000000),
      ConsumableEntity('렌즈케이스', 'images/img_hard_lens.png', '개인위생', 7776000000),
      ConsumableEntity('렌즈케이스', 'images/img_lens_case.png', '개인위생', 7776000000),
      ConsumableEntity('브래지어', 'images/img_lens_case.png', '개인위생', 15552000000),
      ConsumableEntity('이불', 'images/img_blanket.png', '침실', 5184000000),
      ConsumableEntity('베개커버', 'images/img_pillow_cover.png', '침실', 604800000),
      ConsumableEntity('침대시트', 'images/img_bed_sheet.png', '침실', 864000000),
    ];
    return list;
  }
}
