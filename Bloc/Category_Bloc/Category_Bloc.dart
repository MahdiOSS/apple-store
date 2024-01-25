import 'package:apple_store/Bloc/Category_Bloc/Category_State.dart';
import 'package:bloc/bloc.dart';
import '../../Model/Repository/CategoryRepository.dart';
import 'Category_Event.dart';

class CategoryBloc extends Bloc<CategoryEvent,CategoryState> {
  final CategoryRepository _categoryRepository;
  CategoryBloc(this._categoryRepository):super(CategoryInitState()){

    on<LoadCategoriesEvent>((event,emit) async {
      var response = await _categoryRepository.categories();
      emit(LoadCategoryState(response));
    });

  }
}