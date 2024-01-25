import 'dart:developer';

import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Model/DataClass/TokenResponse.dart';
import 'package:apple_store/Model/DataClass/User.dart';
import 'package:apple_store/Model/Repository/DataSource/AuthDataSource.dart';
import 'package:apple_store/Model/Repository/TokenContainer.dart';
import 'package:apple_store/Services/DB/Shared_Perf.dart';
import 'package:dio/dio.dart';

class AuthRepositoryLocal implements AuthDataSource {
  AuthRepositoryLocal(this._sharedPref);

  final SharedPref _sharedPref;

  @override
  Future<Response<User?>> registerUser(
      String username, String password, String passwordConfirm) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  @override
  Future<bool> saveToken(TokenResponse token, String key) async {
    TokenContainer.updateToken(token);
    await _sharedPref.saveData(token.refreshToken, DBName.ACCESS_REFRESH_TOKEN);
    return await _sharedPref.saveData<String>(token.token, key);
  }

  @override
  Future<Response> loginUser(String username, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  void runToken() {
    try {
      String? token = _sharedPref.readToken(DBName.ACCESS_TOKEN);
      String? refreshToken = _sharedPref.readToken(DBName.ACCESS_REFRESH_TOKEN);
      if(token != null) {
        TokenContainer.updateToken(TokenResponse(refreshToken ?? '', token));
      }
    }catch(e){
      print(e);
    }
  }
}
