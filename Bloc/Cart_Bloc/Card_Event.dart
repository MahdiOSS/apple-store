
import 'package:zarinpal/zarinpal.dart';

class CartEvent {}

class CartGetCartItemsEvent extends CartEvent {
  String boxName;
  CartGetCartItemsEvent(this.boxName);
}

class CartInitPaymentEvent extends CartEvent {
  int price;
  String description;
  CartInitPaymentEvent(this.price,this.description);
}

class CartStartPaymentEvent extends CartEvent {
  PaymentRequest paymentRequest;
  CartStartPaymentEvent(this.paymentRequest);
}