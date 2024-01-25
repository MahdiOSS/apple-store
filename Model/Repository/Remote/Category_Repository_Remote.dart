
import 'package:apple_store/Model/Repository/DataSource/CategoryDataSource.dart';
import 'package:dio/dio.dart';

import '../../../Services/Dio/ApiService.dart';

class CategoryRepositoryRemote extends CategoryDataSource {
  ApiService _apiService;
  CategoryRepositoryRemote(this._apiService);

  @override
  Future<Response<dynamic>> categories() => _apiService.getAllCategory();

}