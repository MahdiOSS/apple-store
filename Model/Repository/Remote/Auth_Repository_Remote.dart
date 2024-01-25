import 'package:apple_store/Base/MyExcaption.dart';
import 'package:apple_store/Model/DataClass/TokenResponse.dart';
import 'package:apple_store/Model/Repository/DataSource/AuthDataSource.dart';
import 'package:dio/dio.dart';
import '../../../Services/Dio/ApiService.dart';

class AuthRepositoryRemote implements AuthDataSource {
  ApiService apiService;

  AuthRepositoryRemote(this.apiService);

  @override
  Future<Response<dynamic>> registerUser(
          String username, String password, String passwordConfirm) async {
      return apiService.registerUser(username, password, passwordConfirm);
  }

  @override
  Future<bool> saveToken(TokenResponse token, String key) {
    // TODO: implement saveToken
    throw UnimplementedError();
  }

  @override
  Future<Response> loginUser(String username, String password) =>
      apiService.loginUser(username, password);

  @override
  void runToken() {
    // TODO: implement runToken
  }
}
