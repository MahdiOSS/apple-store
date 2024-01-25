 import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Base/MyExcaption.dart';
import 'package:apple_store/Model/Repository/Remote/Product_Repository_Remote.dart';
import 'package:dio/dio.dart';
import 'ProductDataSource.dart';

class ProductDataSourceImpl extends ProductDataSource{
  final ProductRepositoryRemote _productRepositoryRemote;
  ProductDataSourceImpl(this._productRepositoryRemote);
  @override
  Future<Response> getProduct(ProductSort sort,String categoryId) async {
    try{
      return _productRepositoryRemote.getProduct(sort,categoryId);
    } on DioException catch(ex) {
      throw ApiException(ex.response?.statusCode ?? 0,ex.message ?? '');
    } catch(e){
      throw Exception('error');
    }
  }

  @override
  Future<Response> getProductDetails(String productId) async {
    try{
      return _productRepositoryRemote.getProductDetails(productId);
    } on DioException catch(ex) {
      throw ApiException(ex.response?.statusCode ?? 0,ex.message ?? '');
    } catch(e){
      throw Exception('error');
    }
  }

  @override
  Future<Response> getProductVariants(String productId) {
    try{
      return _productRepositoryRemote.getProductVariants(productId);
    } on DioException catch(ex) {
      throw ApiException(ex.response?.statusCode ?? 0,ex.message ?? '');
    } catch(e){
      throw Exception('error');
    }
  }

  @override
  Future<Response> getCategoryName(String categoryId) {
    try{
      return _productRepositoryRemote.getCategoryName(categoryId);
    } on DioException catch(ex) {
      throw ApiException(ex.response?.statusCode ?? 0,ex.message ?? '');
    } catch(e){
      throw Exception('error');
    }
  }

  @override
  Future<Response> getProperties(String productId) {
    try{
      return _productRepositoryRemote.getProperties(productId);
    } on DioException catch(ex) {
      throw ApiException(ex.response?.statusCode ?? 0,ex.message ?? '');
    } catch(e){
      throw Exception('error');
    }
  }
}