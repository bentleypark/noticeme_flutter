import 'package:noticemeflutter/data/db/consumable_dao.dart';
import 'package:noticemeflutter/data/db/consumable_entity.dart';
import 'package:meta/meta.dart';
import 'package:noticemeflutter/data/db/user_consumable_entity.dart';

class MainRepository {
  final ConsumableDao consumableDao;

  MainRepository({@required this.consumableDao});

  Future<void> insertConsumable(ConsumableEntity element) {
    // list.forEach((element) async {
    return consumableDao.insertConsumable(element);
    // });
  }
}
