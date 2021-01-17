import 'package:floor/floor.dart';
import 'package:noticemeflutter/data/db/user_consumable_entity.dart';

@dao
abstract class UserConsumableDao {
  @Query('SELECT * FROM userConsumables')
  Future<List<UserConsumableEntity>> getAllConsumable();

  @insert
  Future<void> insertUserConsumable(UserConsumableEntity userConsumableEntity);
}
