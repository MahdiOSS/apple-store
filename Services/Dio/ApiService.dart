import 'package:apple_store/Base/Constant.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response<dynamic>> registerUser(
          String username, String password, String passwordConfirm) =>
      _dio.post(
        'collections/users/records',
        data: {
          'username': username,
          'password': password,
          'passwordConfirm': passwordConfirm,
          'verified': false
        },
      );

  Future<Response<dynamic>> loginUser(String username, String password) =>
      _dio.post('collections/users/auth-with-password',
          data: {'identity': username, 'password': password});

  Future<Response<dynamic>> getAllCategory() =>
      _dio.get('collections/Category/records');

  Future<Response<dynamic>> getCategoryWithId(String categoryId) {
    Map<String,String> q = {
      'filter':'id="$categoryId"'
    };
    return _dio.get('collections/Category/records',queryParameters: q);
  }

  Future<Response<dynamic>> getBanners() =>
      _dio.get('collections/BannerSlider/records');

  Future<Response<dynamic>> getProduct(ProductSort sort,String categoryId) {
    if (sort.name == ProductSort.allProduct.name) {
      var q = {'filter':'category="$categoryId"'};
      if(categoryId.isNotEmpty){
        return _dio.get('collections/Products/records',queryParameters: q);
      }else {
        return _dio.get('collections/Products/records');
      }
    } else {
      Map<String, String> q = {'filter':'sort="${sort.name}"${categoryId.isNotEmpty ? '&& category="$categoryId"' : ''}'};
      return _dio.get('collections/Products/records', queryParameters: q);
    }
  }

  Future<Response<dynamic>> getProductDetails(String productId){
    Map<String,String> q = {
      'filter':'product_id="$productId"'
    };
    return _dio.get('collections/Product_Detail/records',queryParameters: q);
  }

  Future<Response<dynamic>> getProductVariants(String productId){
    Map<String,String> q = {
      'filter':'product_id="$productId"'
    };
    return _dio.get('collections/Variants/records',queryParameters: q);
  }

  Future<Response<dynamic>> getProductProperties(String productId){
    Map<String,String> q = {
      'filter':'product_id="$productId"'
    };
    return _dio.get('collections/Properties/records',queryParameters: q);
  }

}
