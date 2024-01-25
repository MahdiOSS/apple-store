import 'package:bloc/bloc.dart';
import '../../Model/Repository/CardRepository.dart';
import 'Card_Event.dart';
import 'Card_State.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CardRepository _cardRepository;

  CartBloc(this._cardRepository) : super((InitCartState())) {

    on<CartInitPaymentEvent>((event, emit) async {
      emit(CartLoadingState(true));
      var pay = _cardRepository.initPayment(event.price, event.description);
      emit(CartLoadingState(false));
      emit(CartPaymentRequestState(pay));
    });

    on<CartStartPaymentEvent>((event, emit) async {
      emit(CartLoadingState(true));
      _cardRepository.startPayment(event.paymentRequest);
      emit(CartLoadingState(false));
    });

    on<CartGetCartItemsEvent>((event, emit) async {
      emit(CartLoadingState(true));
      var response = await _cardRepository.getCardItems(event.boxName);
      emit(CartLoadingState(false));
      if (response.fold((l) {
        return true;
      }, (r) {
        if (r.isEmpty) {
          return true;
        } else {
          return false;
        }
      })) {
        emit(CartEmptyState(true));
      }else {
        emit(CartItemsState(response));
      }
    });

  }
}
