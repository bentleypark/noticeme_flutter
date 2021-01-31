import 'package:floor/floor.dart';

@Entity(tableName: 'userConsumables')
class UserConsumableEntity {
  // int id = 0;
  @PrimaryKey(autoGenerate: false)
  String title;

  String image;

  String category;

  int duration;

  int starDate;

  int endDate;

  int priority = 0;

  UserConsumableEntity(this.title, this.image, this.category, this.duration,
      this.starDate, this.endDate, this.priority);

  UserConsumableEntity.withoutIdAndPriority(
    this.title,
    this.image,
    this.category,
    this.duration,
    this.starDate,
    this.endDate,
  );
}
