
import 'package:apple_store/Model/DataClass/User.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<String, User>> registerUser(
      String username, String password, String passwordConfirm);

  Future<Either<String, User>> loginUser(
      String username, String password);
}
