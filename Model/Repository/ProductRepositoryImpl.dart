import 'dart:developer';

import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Base/MyExcaption.dart';
import 'package:apple_store/Model/DataClass/Product.dart';
import 'package:apple_store/Model/DataClass/Product_Details.dart';
import 'package:apple_store/Model/DataClass/Product_Variant.dart';
import 'package:apple_store/Model/DataClass/Properties.dart';
import 'package:apple_store/Model/Repository/DataSource/ProductDataSource.dart';
import 'package:apple_store/Model/Repository/ProductRepository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDataSource _productDataSource;

  ProductRepositoryImpl(this._productDataSource);

  @override
  Future<Either<String, List<Product>>> getProduct({ProductSort sort = ProductSort.allProduct, String categoryId = ''}) async {
    try {
      var response = await _productDataSource.getProduct(sort,categoryId);
      Map<String, dynamic> json = response.data;
      log(json.toString());
      List<Product> list = List.generate(json['totalItems'],
              (index) => Product.fromJson(json['items'][index]));
      return Right(list);
    } on ApiException catch (e) {
      return Left(e.message);
    } catch (e) {
      print(e);
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ProductDetail>> getProductDetails(
      String productId) async {
    try {
      var response = await _productDataSource.getProductDetails(productId);
      Map<String, dynamic> json = response.data['items'][0];
      ProductDetail productDetail = ProductDetail.fromJson(json);
      return Right(productDetail);
    } on ApiException catch (e) {
      return Left(e.message);
    } catch (e) {
      print(e);
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ProductVariant>> getProductVariants(
      String productId) async {
    try {
      var response = await _productDataSource.getProductVariants(productId);
      Map<String, dynamic> json = response.data['items'][0];
      log(json.toString());
      ProductVariant productVariant = ProductVariant.fromJson(json);
      return Right(productVariant);
    } on ApiException catch (e) {
      return Left(e.message);
    } catch (e) {
      print(e);
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> getCategoryName(String categoryId) async {
    try {
      var response = await _productDataSource.getCategoryName(categoryId);
      Map<String, dynamic> json = response.data['items'][0];
      String name = json['name_category'];
      return Right(name);
    } on ApiException catch (e) {
      return Left(e.message);
    } catch (e) {
      print(e);
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Properties>>> getProperties(String productId) async {
    try {
      var response = await _productDataSource.getProperties(productId);
      Map<String, dynamic> json = response.data;
      List<Properties> properties = List<Properties>.generate(
          (json['items'] as List<dynamic>).length,
          (index) => Properties.fromJson(json['items'][index]));
      return Right(properties);
    } on ApiException catch (e) {
      return Left(e.message);
    } catch (e) {
      print(e);
      return Left(e.toString());
    }
  }

}
