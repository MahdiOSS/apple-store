import 'package:apple_store/Model/DataClass/TokenResponse.dart';
import 'package:apple_store/Model/Repository/Local/Auth_Repository_Local.dart';
import 'package:apple_store/Model/Repository/Remote/Auth_Repository_Remote.dart';
import 'package:dio/dio.dart';
import '../../../Base/Constant.dart';
import '../../../Base/MyExcaption.dart';
import 'AuthDataSource.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final AuthRepositoryRemote _authRepositoryRemote;
  final AuthRepositoryLocal _authRepositoryLocal;

  AuthDataSourceImpl(this._authRepositoryLocal, this._authRepositoryRemote);

  @override
  Future<Response<dynamic>> registerUser(
      String username, String password, String passwordConfirm) async {
    try {
      var response = await _authRepositoryRemote.registerUser(
          username, password, passwordConfirm);
      await loginUser(username, password);
      return response;
    } on DioException catch (e) {
      throw ApiException(
          e.response?.statusCode ?? 000, e.response?.data ?? 'error');
    } catch (ex) {
      throw ApiException(0, 'خطای نامشخص لطفا اتصال خود را چک کنید');
    }
  }

  @override
  Future<bool> saveToken(TokenResponse token, String key) async {
    try {
      return _authRepositoryLocal.saveToken(token, key);
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<Response> loginUser(String username, String password) async {
    try {
      var response = await _authRepositoryRemote.loginUser(username, password);
      var token = response.data['token'];
      await _authRepositoryLocal.saveToken(TokenResponse('', token),DBName.ACCESS_TOKEN);
      return response;
    } on DioException catch(e){
      throw ApiException(e.response?.statusCode ?? 000, e.response?.statusMessage??'');
    } catch(ex){
      throw Exception('خطای نامشخص لطفا اتصال خود را چک کنید');
    }
  }

  @override
  void runToken() {
    _authRepositoryLocal.runToken();
  }
}
