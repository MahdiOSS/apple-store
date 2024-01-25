import '../../DataClass/Card_Item.dart';

abstract class CardDataSource {
  Future<dynamic> getCardItems(String boxName);
  Future<void> putCardItem(CardItem cardItem,String boxName);
}