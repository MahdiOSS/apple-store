import 'package:apple_store/Base/MyExcaption.dart';
import 'package:apple_store/Model/Repository/DataSource/CategoryDataSource.dart';
import 'package:apple_store/Model/Repository/Remote/Category_Repository_Remote.dart';
import 'package:dio/dio.dart';

class CategoryDataSourceImpl extends CategoryDataSource {
  final CategoryRepositoryRemote _categoryRepositoryRemote;
  CategoryDataSourceImpl(this._categoryRepositoryRemote);

  @override
  Future<Response<dynamic>> categories() {
    try{
      return _categoryRepositoryRemote.categories();
    } on DioException catch(e){
      throw ApiException(e.response?.statusCode ?? 000, e.response?.statusMessage ?? '');
    } catch (ex){
      throw Exception(ex.toString());
    }
  }

}