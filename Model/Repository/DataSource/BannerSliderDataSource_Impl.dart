import 'package:apple_store/Base/MyExcaption.dart';
import 'package:apple_store/Model/Repository/DataSource/BannerSliderDataSource.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';

import '../Remote/BannerSlider_Repository_Remote.dart';

class BannerSliderDataSourceImpl extends BannerDataSource {
  final BannerSliderRepositoryRemote _bannerSliderRepositoryRemote;
  BannerSliderDataSourceImpl(this._bannerSliderRepositoryRemote);

  @override
  Future<Response> getBanners() async {
    try {
     return await _bannerSliderRepositoryRemote.getBanners();
    } on DioException catch(ex){
      throw ApiException(ex.response?.statusCode ?? 0, ex.message ?? '');
    } catch(e){
      throw Exception();
    }
  }

}