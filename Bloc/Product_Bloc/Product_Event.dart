import '../../Model/DataClass/Card_Item.dart';

class ProductEvent {}

class GetProductDetailsEvent extends ProductEvent {
  String productId;
  GetProductDetailsEvent(this.productId);
}

class GetProductVariantsEvent extends ProductEvent {
  String productId;
  GetProductVariantsEvent(this.productId);
}

class GetCategoryNameEvent extends ProductEvent {
  String categoryId;
  GetCategoryNameEvent(this.categoryId);
}

class GetPropertiesEvent extends ProductEvent {
  String productId;
  GetPropertiesEvent(this.productId);
}

class GetProductsEvent extends ProductEvent {
  String categoryId;
  GetProductsEvent(this.categoryId);
}

class PutCardItemsEvent extends ProductEvent {
  CardItem cardItem;
  String boxName;
  PutCardItemsEvent(this.boxName,this.cardItem);
}