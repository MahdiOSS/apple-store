import 'package:apple_store/Model/DataClass/Card_Item.dart';
import 'package:apple_store/Model/Repository/CardRepository.dart';
import 'package:apple_store/Model/Repository/DataSource/CardDataSource.dart';
import 'package:dartz/dartz.dart';
import 'package:zarinpal/src/payment_request.dart';
import '../../Services/Payment/Payment.dart';

class CardRepositoryImpl extends CardRepository {
  final CardDataSource _cardDataSource;
  final MyPayment _myPayment;

  CardRepositoryImpl(this._cardDataSource,this._myPayment);

  @override
  Future<Either<String, List<CardItem>>> getCardItems(String boxName) async {
    try {
      List<CardItem> response = await _cardDataSource.getCardItems(boxName);
      return Right(response);
    } catch (ex) {
      return Left(ex.toString());
    }
  }

  @override
  Future<Either<String,String>> putCardItem(CardItem cardItem,String boxName) async {
    try {
      await _cardDataSource.putCardItem(cardItem, boxName);
      return right('به سبد خرید اضافه شد !');
    } catch(ex){
      return left('خطا در ذخیره محصول در سبد خرید !');
    }
  }

  @override
  Either<String, PaymentRequest> initPayment(int price, String description) {
    try {
      PaymentRequest pay = _myPayment.initPayment(
          price: price, description: description);
      return Right(pay);
    }catch(ex){
      return Left(ex.toString());
    }
  }

  @override
  void startPayment(PaymentRequest paymentRequest) {
    _myPayment.startPay(paymentRequest: paymentRequest);
  }


}