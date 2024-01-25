import 'package:apple_store/Model/Repository/DataSource/CardDataSource.dart';
import 'package:apple_store/Services/DB/Hive.dart';

import '../../DataClass/Card_Item.dart';

class CardRepositoryLocal extends CardDataSource {
  final MyHive _db;
  CardRepositoryLocal(this._db);

  @override
  Future getCardItems(String boxName) => _db.getCardItems(boxName);

  @override
  Future<void> putCardItem(CardItem cardItem,String boxName) => _db.saveCardItem(cardItem, boxName);

}