import 'dart:async';

import 'package:floor/floor.dart';
import 'package:noticemeflutter/data/consumable_dao.dart';
import 'package:noticemeflutter/data/consumable_entity.dart';

part 'noticeme_database.g.dart';

@Database(version: 1, entities: [ConsumableEntity])
abstract class NoticemeDatabase extends FloorDatabase {
  ConsumableDao get consumableDao;
}
