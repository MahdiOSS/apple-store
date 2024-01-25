import 'package:apple_store/Model/DataClass/Card_Item.dart';
import 'package:dartz/dartz.dart';
import 'package:zarinpal/zarinpal.dart';

abstract class CardRepository {
  Future<Either<String,List<CardItem>>> getCardItems(String boxName);
  Future<Either<String,String>> putCardItem(CardItem cardItem,String boxName);
  Either<String,PaymentRequest> initPayment(int price,String description);
  void startPayment(PaymentRequest paymentRequest);
}