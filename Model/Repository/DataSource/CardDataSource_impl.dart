import 'package:apple_store/Model/Repository/DataSource/CardDataSource.dart';
import 'package:apple_store/Model/Repository/Local/Card_Repository_Local.dart';
import '../../DataClass/Card_Item.dart';

class CardDataSourceImpl extends CardDataSource {
  final CardRepositoryLocal _cardRepositoryLocal;
  CardDataSourceImpl(this._cardRepositoryLocal);

  @override
  Future getCardItems(String boxName) async {
    try {
      return await _cardRepositoryLocal.getCardItems(boxName);
    } catch (ex){
      throw Exception(ex.toString());
    }
  }

  @override
  Future<void> putCardItem(CardItem cardItem,String boxName) async {
    return await _cardRepositoryLocal.putCardItem(cardItem, boxName);
  }

}