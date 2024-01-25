import 'package:apple_store/Bloc/Product_Bloc/Product_State.dart';
import 'package:apple_store/Model/Repository/CardRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Model/Repository/ProductRepository.dart';
import 'Product_Event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  final CardRepository _cardRepository;

  ProductBloc(this._productRepository,this._cardRepository) : super(ProductInitState()) {
    on<GetProductDetailsEvent>((event, emit) async {
      emit(ProductLoadingState(true));
      var response = await _productRepository.getProductDetails(event.productId);
      emit(ProductLoadingState(false));
      emit(ProductDetailsState(response));
    });

    on<GetProductVariantsEvent>((event, emit) async {
      emit(ProductLoadingState(true));
      var response = await _productRepository.getProductVariants(event.productId);
      emit(ProductLoadingState(false));
      emit(ProductVariantsState(response));
    });

    on<GetCategoryNameEvent>((event, emit) async {
      emit(ProductLoadingState(true));
      var name = await _productRepository.getCategoryName(event.categoryId);
      emit(ProductLoadingState(false));
      emit(ProductCategoryNameState(name));
    });

    on<GetPropertiesEvent>((event, emit) async {
      emit(ProductLoadingState(true));
      var properties = await _productRepository.getProperties(event.productId);
      emit(ProductLoadingState(false));
      emit(ProductPropertiesState(properties));
    });

    on<GetProductsEvent>((event, emit) async {
      emit(ProductLoadingState(true));
      var products = await _productRepository.getProduct(categoryId: event.categoryId);
      emit(ProductLoadingState(false));
      emit(ProductProductsState(products));
    });

    on<PutCardItemsEvent>((event, emit) async {
      var cardItem = await _cardRepository.putCardItem(event.cardItem,event.boxName);
      emit(PutCardItemState(cardItem));
    });

  }

}
