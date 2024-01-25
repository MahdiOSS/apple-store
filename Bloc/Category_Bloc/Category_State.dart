import 'package:apple_store/Model/DataClass/Categories.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryState {}

class CategoryInitState extends CategoryState {}

class LoadCategoryState extends CategoryState {
  Either<String,Categories> categories;
  LoadCategoryState(this.categories);
}