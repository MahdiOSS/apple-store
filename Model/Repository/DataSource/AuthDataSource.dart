
import 'package:apple_store/Model/DataClass/TokenResponse.dart';
import 'package:dio/dio.dart';

abstract class AuthDataSource {
 Future<Response<dynamic>> registerUser(String username,String password, String passwordConfirm);

 Future<Response<dynamic>> loginUser(String username,String password);

 Future<bool> saveToken(TokenResponse token,String key);

 void runToken();

}