import 'package:hive/hive.dart';
part 'Card_Item.g.dart';

@HiveType(typeId: 0)
class CardItem {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  num? price;
  @HiveField(3)
  String? imageUrl;
  @HiveField(4)
  int? count;
  @HiveField(5)
  bool liked = false;
  @HiveField(6)
  num? discount;

  CardItem(this.title, this.price, this.imageUrl,
      this.count, this.liked, this.discount);

}