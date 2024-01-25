import 'package:apple_store/Base/MyExcaption.dart';
import 'package:apple_store/Model/Repository/AuthRepository.dart';
import 'package:apple_store/Model/Repository/DataSource/AuthDataSource.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../DataClass/User.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  //...
  @override
  Future<Either<String,User>> registerUser(
          String username, String password, String passwordConfirm) async {
    try {
      var response = await _dataSource.registerUser(username, password, passwordConfirm);
        Map<String, dynamic> json = response.data;
        User user = User.fromJson(json);
        print(user.username);
        return Right(user);
    } on ApiException catch(e) {
      print("***ERROR -> ${e.message}");
       return Left('message : ${e.message}  code : ${e.code}');
    } catch (ex){
      print(ex.toString());
      return const Left('خطا مشکلی پیش آمده !');
    }
  }

  @override
  Future<Either<String, User>> loginUser(String username, String password) async {
    Response<dynamic>? response;
   try{
     response = await _dataSource.loginUser(username, password);
     Map<String,dynamic> json = response.data['record'];
     User user = User.fromJson(json);
     return Right(user);
   } on ApiException catch(e){
    return Left(e.message);
   } catch(ex) {
     String error = response?.data;
     return Left(error);
   }
  }
}
