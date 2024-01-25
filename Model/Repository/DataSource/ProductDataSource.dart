import 'package:apple_store/Base/Constant.dart';
import 'package:dio/dio.dart';

abstract class ProductDataSource {
  Future<Response<dynamic>> getProduct(ProductSort sort,String categoryId);
  Future<Response<dynamic>> getProductDetails(String productId);
  Future<Response<dynamic>> getProductVariants(String productId);
  Future<Response<dynamic>> getCategoryName(String categoryId);
  Future<Response<dynamic>> getProperties(String productId);
}