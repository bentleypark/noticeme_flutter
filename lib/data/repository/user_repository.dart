import 'package:noticemeflutter/data/db/noticeme_database.dart';
import 'package:noticemeflutter/data/db/user_consumable_entity.dart';

class UserRepository {
  Future<List<UserConsumableEntity>> getUserConsumableList() async {
    var list = await NoticemeDatabase.init()
        .then((db) => db.userConsumableDao.getAllConsumable());
    return list;
  }
}
