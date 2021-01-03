import 'package:floor/floor.dart';

@Entity(tableName: 'consumables')
class ConsumableEntity {
  @PrimaryKey(autoGenerate: false)
  final String title;

  final String image;

  final String category;

  final int duration;

  ConsumableEntity(this.title, this.image, this.category, this.duration);
}
