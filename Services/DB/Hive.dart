import 'package:apple_store/Model/DataClass/Card_Item.dart';
import 'package:hive_flutter/adapters.dart';

class MyHive {
  var box = Hive.box<CardItem>("card_item_box_db");

  Future<void> saveCardItem(CardItem cardItem, String name) async {
    try {
      await box.add(cardItem);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<CardItem>?> getCardItems(String name) async {
    return box.values.toList();
  }
}
