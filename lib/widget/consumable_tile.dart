import 'package:flutter/material.dart';
import 'package:noticemeflutter/data/db/consumable_entity.dart';
import 'package:noticemeflutter/data/db/noticeme_database.dart';
import 'package:noticemeflutter/data/db/user_consumable_entity.dart';
import 'package:noticemeflutter/resources/const.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';

class ConsumableTile extends StatelessWidget {
  ConsumableTile(this.consumableEntity);

  final ConsumableEntity consumableEntity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: SizedBox(
        height: displayWidth(context) * 0.4,
        child: Image.asset(consumableEntity.image),
      ),
      title: Row(
        children: [
          Text(consumableEntity.title),
          Spacer(),
          Text(
            convertDurationToDay(),
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
      trailing: Text(''),
      onTap: () {
        insert();
        final snackBar = SnackBar(
          content: Text('소모품이 추가되었습니다!'),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
    );
  }

  String convertDurationToDay() {
    return (consumableEntity.duration / ONE_DAY_MILLISECONDS)
            .toStringAsFixed(0) +
        '일';
  }

  insert() async {
    final database = await $FloorNoticemeDatabase
        .databaseBuilder('noticeme_database.db')
        .build();
    var dao = database.userConsumableDao;
    var current = DateTime.now().millisecondsSinceEpoch;

    dao.insertUserConsumable(UserConsumableEntity.withoutIdAndPriority(
        consumableEntity.title,
        consumableEntity.image,
        consumableEntity.category,
        consumableEntity.duration,
        current,
        current + consumableEntity.duration));
  }
}
