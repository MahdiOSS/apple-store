import 'package:apple_store/Model/DataClass/Categories.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {

  Future<Either<String,Categories>> categories ();

}