
import 'package:apple_store/Base/Constant.dart';
import '../../Model/DataClass/Product_Details.dart';

abstract class HomeEvent {}

class HomeGetBannersEvent extends HomeEvent { }

class HomeGetCategoryEvent extends HomeEvent { }

class HomeGetBestSellerProductsEvent extends HomeEvent {
  ProductSort sort;
  HomeGetBestSellerProductsEvent(this.sort);
}

class HomeGetMostVisitedProductsEvent extends HomeEvent {
  ProductSort sort;
  HomeGetMostVisitedProductsEvent(this.sort);
}

class HomeGetProductDetailsEvent extends HomeEvent {
  String productId;
  HomeGetProductDetailsEvent(this.productId);
}


