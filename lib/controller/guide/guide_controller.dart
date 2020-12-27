import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/data/db/consumable_entity.dart';
import 'package:noticemeflutter/data/repository/main_repository.dart';

class GuideController extends GetxController {
  final MainRepository mainRepository;

  GuideController({@required this.mainRepository}) : assert(mainRepository != null);

  final PageController _pageController = PageController(initialPage: 0);

  get pageController => this._pageController;

  var _currentPage = 0.obs;

  get currentPage => this._currentPage;

  set currentPage(value) => this._currentPage = value;

  Future<void> insertInitialData() => mainRepository.insertConsumable(
      ConsumableEntity(0, '칫솔', 'images/img_toothbrush.png', '욕실', 7776000000));
}
