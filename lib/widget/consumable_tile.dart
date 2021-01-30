import 'package:flutter/material.dart';
import 'package:noticemeflutter/data/db/consumable_entity.dart';
import 'package:noticemeflutter/utils/ex_fucs.dart';

class ConsumableTile extends StatelessWidget {
  ConsumableTile(this.consumableEntity);

  ConsumableEntity consumableEntity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: SizedBox(
          height: displayWidth(context) * 0.4,
          child: Image.asset(consumableEntity.image)),
      title:
          // Row(
          //   children: [
          Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          consumableEntity.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),

      trailing: Padding(
        padding: EdgeInsets.only(right: 70),
        child: Text(
          convertDurationToDay(consumableEntity.duration),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      //     Spacer(),
      //     Text(
      //       convertDurationToDay(consumableEntity.duration),
      //       style: TextStyle(fontWeight: FontWeight.bold),
      //     ),
      //     Spacer(),
      //   ],
      // ),
      // subtitle: Text(convertDurationToDay(consumableEntity.duration),
      //     style: TextStyle(fontWeight: FontWeight.bold)),
      onTap: () {},
    );
  }

  // 86400000: 1 Day milliseconds
  String convertDurationToDay(int duration) {
    return (duration / 86400000).toStringAsFixed(0) + '일';
  }
}
