import 'package:apple_store/Model/DataClass/BannerSlider.dart';
import 'package:apple_store/Model/DataClass/Categories.dart';
import 'package:apple_store/Model/DataClass/Product.dart';
import 'package:apple_store/Model/DataClass/Product_Details.dart';
import 'package:dartz/dartz.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeBannersState extends HomeState {
  Either<String,BannerSliders> sliders;
  HomeBannersState(this.sliders);
}

class HomeCategoryState extends HomeState {
  Either<String,Categories> categories;
  HomeCategoryState(this.categories);
}

class HomeBestSellerProductsState extends HomeState {
  Either<String,List<Product>> products;
  HomeBestSellerProductsState(this.products);
}

class HomeMostVisitedProductsState extends HomeState {
  Either<String,List<Product>> products;
  HomeMostVisitedProductsState(this.products);
}

class HomeLoadingState extends HomeState {
  bool active;
  HomeLoadingState(this.active);
}


