import 'package:flutter/material.dart';
import 'package:noticemeflutter/data/db/user_consumable_entity.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';

class UserConsumableTile extends StatelessWidget {
  UserConsumableTile(this.userConsumableEntity);

  final UserConsumableEntity userConsumableEntity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: SizedBox(
            height: displayWidth(context) * 0.4,
            child: Image.asset(userConsumableEntity.image)),
        title: Row(
          children: [
            Text(userConsumableEntity.title),
            Spacer(),
            Text(
              userConsumableEntity.duration.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        trailing: Icon(Icons.keyboard_arrow_right));
  }
}
