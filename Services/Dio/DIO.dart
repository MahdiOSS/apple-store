import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import '../../Base/Constant.dart';

Dio createDio() {
  Dio dio = Dio(BaseOptions(
      baseUrl: BaseDomain.baseUrl,
      ));

  dio.interceptors.add(RetryInterceptor(
      dio: dio,
  ));

   // dio.head(
   //   'Auth'
   // );

  return dio;
}
