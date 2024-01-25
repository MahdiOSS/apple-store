import 'dart:developer';

import 'package:apple_store/Bloc/Home_Bloc/Home_Event.dart';
import 'package:apple_store/Bloc/Home_Bloc/Home_State.dart';
import 'package:apple_store/Model/Repository/BannerSliderRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Model/Repository/CategoryRepository.dart';
import '../../Model/Repository/ProductRepository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BannerRepository _sliderRepository;
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;

  HomeBloc(this._sliderRepository, this._categoryRepository,this._productRepository)
      : super(HomeInitState()) {

    on<HomeGetBannersEvent>((event, emit) async {
      var banners = await _sliderRepository.getBanners();
      emit(HomeBannersState(banners));
    });

    on<HomeGetCategoryEvent>((event, emit) async {
      var category = await _categoryRepository.categories();
      emit(HomeCategoryState(category));
    });

    on<HomeGetBestSellerProductsEvent>((event, emit) async {
      var products = await _productRepository.getProduct(sort:event.sort);
      log(products.toString());
      emit(HomeBestSellerProductsState(products));
    });

    on<HomeGetMostVisitedProductsEvent>((event, emit) async {
      var products = await _productRepository.getProduct(sort:event.sort);
      emit(HomeMostVisitedProductsState(products));
    });

  }
}
