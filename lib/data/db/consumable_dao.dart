import 'package:floor/floor.dart';
import 'package:noticemeflutter/data/db/consumable_entity.dart';

@dao
abstract class ConsumableDao {
  @Query('SELECT * FROM consumables')
  Future<List<ConsumableEntity>> getAllConsumable();

  @insert
  Future<void> insertConsumable(ConsumableEntity consumableEntity);
}
