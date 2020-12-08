import 'package:floor/floor.dart';

@Entity(tableName: 'consumables')
class ConsumableEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String title;

  final int image;

  final String category;

  final double duration;

  ConsumableEntity(
      this.id, this.title, this.image, this.category, this.duration);
}
