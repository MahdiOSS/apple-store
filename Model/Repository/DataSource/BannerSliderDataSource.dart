import 'package:dio/dio.dart';

abstract class BannerDataSource {
  Future<Response<dynamic>> getBanners();
}