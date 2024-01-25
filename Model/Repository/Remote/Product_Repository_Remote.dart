import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Model/Repository/DataSource/ProductDataSource.dart';
import 'package:dio/src/response.dart';
import '../../../Services/Dio/ApiService.dart';

class ProductRepositoryRemote extends ProductDataSource {
  final ApiService _apiService;
  ProductRepositoryRemote(this._apiService);

  @override
  Future<Response> getProduct(ProductSort sort,String categoryId) => _apiService.getProduct(sort,categoryId);

  @override
  Future<Response> getProductDetails(String productId) => _apiService.getProductDetails(productId);

  @override
  Future<Response> getProductVariants(String productId) => _apiService.getProductVariants(productId);

  @override
  Future<Response> getCategoryName(String categoryId) => _apiService.getCategoryWithId(categoryId);

  @override
  Future<Response> getProperties(String productId) => _apiService.getProductProperties(productId);

}