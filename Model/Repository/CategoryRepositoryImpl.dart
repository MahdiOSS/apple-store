import 'package:apple_store/Base/MyExcaption.dart';
import 'package:apple_store/Model/DataClass/Categories.dart';
import 'package:apple_store/Model/Repository/CategoryRepository.dart';
import 'package:apple_store/Model/Repository/DataSource/CategoryDataSource.dart';
import 'package:dartz/dartz.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryDataSource _categoryDataSource;
  CategoryRepositoryImpl(this._categoryDataSource);

  @override
  Future<Either<String, Categories>> categories() async {
    try {
      var response = await _categoryDataSource.categories();
      var data = response.data;
      Map<String,dynamic> json = data;
      Categories categories = Categories.fromJson(json);
      return Right(categories);
    } on ApiException catch (e){
      return Left(e.message);
    } catch (e){
      return const Left('error');
    }
  }

}