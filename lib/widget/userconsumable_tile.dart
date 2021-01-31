import 'package:flutter/material.dart';
import 'package:noticemeflutter/data/db/user_consumable_entity.dart';
import 'package:noticemeflutter/resources/const.dart';
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
            showExpiredDay()
          ],
        ),
        trailing: Icon(Icons.keyboard_arrow_right));
  }

  double convertStartDate() {
    var current = DateTime.now().millisecondsSinceEpoch;
    return ((userConsumableEntity.endDate - current) / ONE_DAY_MILLISECONDS);
  }

  Widget showExpiredDay() {
    var result = convertStartDate();
    if (result > 0) {
      return Text('-' + convertStartDate().toStringAsFixed(0) + '일',
          style: TextStyle(fontWeight: FontWeight.bold));
    } else if (result == 0) {
      return Text('D-Day',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red));
    } else if (result < 0) {
      return Text('+' + convertStartDate().toStringAsFixed(0) + '일',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red));
    }
  }
}
