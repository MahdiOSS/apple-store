import 'package:apple_store/Model/DataClass/Card_Item.dart';
import 'package:dartz/dartz.dart';
import 'package:zarinpal/zarinpal.dart';

class CartState {}

class InitCartState extends CartState {}

class CartLoadingState extends CartState {
  bool progress;
  CartLoadingState(this.progress);
}

class CartEmptyState extends CartState {
  bool empty;
  CartEmptyState(this.empty);
}

class CartItemsState extends CartState {
  Either<String,List<CardItem>> cardItems;
  CartItemsState(this.cardItems);
}

class CartPaymentRequestState extends CartState {
  Either<String,PaymentRequest> payRequest;
  CartPaymentRequestState(this.payRequest);
}