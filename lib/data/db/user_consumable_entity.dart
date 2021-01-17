import 'package:floor/floor.dart';

@Entity(tableName: 'userConsumables')
class UserConsumableEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String title;

  final String image;

  final String category;

  final int duration;

  final int starDate;

  final int endDate;

  final int priority;

  UserConsumableEntity(this.id, this.title, this.image, this.category,
      this.duration, this.starDate, this.endDate, this.priority);
}
