import 'dart:async';
import 'package:floor/floor.dart';
import 'package:noticemeflutter/data/db/consumable_dao.dart';
import 'package:noticemeflutter/data/db/consumable_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'noticeme_database.g.dart';

@Database(version: 1, entities: [ConsumableEntity])
abstract class NoticemeDatabase extends FloorDatabase {
  ConsumableDao get consumableDao;
}