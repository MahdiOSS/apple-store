import 'package:apple_store/Model/Repository/DataSource/BannerSliderDataSource.dart';
import 'package:dio/src/response.dart';

import '../../../Services/Dio/ApiService.dart';

class BannerSliderRepositoryRemote extends BannerDataSource {
  ApiService _apiService;
  BannerSliderRepositoryRemote(this._apiService);

  @override
  Future<Response> getBanners() async => await _apiService.getBanners();

}