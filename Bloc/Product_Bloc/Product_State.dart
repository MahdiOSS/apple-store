import 'package:apple_store/Model/DataClass/Product.dart';
import 'package:apple_store/Model/DataClass/Product_Variant.dart';
import 'package:apple_store/Model/DataClass/Properties.dart';
import 'package:dartz/dartz.dart';
import '../../Model/DataClass/Product_Details.dart';

class ProductState {}

class ProductInitState extends ProductState {}

class ProductDetailsState extends ProductState {
  Either<String, ProductDetail> productDetail;
  ProductDetailsState(this.productDetail);
}

class ProductLoadingState extends ProductState {
  bool active;
  ProductLoadingState(this.active);
}

class ProductVariantsState extends ProductState {
  Either<String, ProductVariant> productVariant;
  ProductVariantsState(this.productVariant);
}

class ProductCategoryNameState extends ProductState {
  Either<String, String> category;
  ProductCategoryNameState(this.category);
}

class ProductPropertiesState extends ProductState {
  Either<String, List<Properties>> properties;
  ProductPropertiesState(this.properties);
}

class ProductProductsState extends ProductState {
  Either<String, List<Product>> product;
  ProductProductsState(this.product);
}

class PutCardItemState extends ProductState {
  Either<String, String> cardItem;
  PutCardItemState(this.cardItem);
}
