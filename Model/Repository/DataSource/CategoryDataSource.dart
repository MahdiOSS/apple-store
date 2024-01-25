import 'package:dio/dio.dart';

abstract class CategoryDataSource {
  Future<Response<dynamic>> categories ();
}