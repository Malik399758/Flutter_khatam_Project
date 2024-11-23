import 'package:hive/hive.dart';

part 'item_model.g.dart'; // Make sure to generate your adapter using build_runner

@HiveType(typeId: 0)
class Item extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String dateTime; // Store dateTime as a String

  @HiveField(2)
  bool isSelected;

  Item({
    required this.title,
    this.dateTime = '',
    this.isSelected = false,
  });
}
