import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

abstract class MyPayment {

  PaymentRequest initPayment(
      {required int price, required String description});

  void startPay({required PaymentRequest paymentRequest});

  PaymentStatus verifyPayment({
    required String status,
    required String authority,
    required PaymentRequest paymentRequest});
}

class ZarinPal_Payment extends MyPayment {

  final PaymentRequest _paymentRequest;
  ZarinPal_Payment(this._paymentRequest);

  @override
  PaymentRequest initPayment(
      {required int price, required String description}) {
    _paymentRequest.setIsSandBox(true);
    _paymentRequest.setAmount(price);
    _paymentRequest.setDescription(description);
    _paymentRequest.setMerchantID('');
    _paymentRequest.setCallbackURL('abolfazl://apple.store');

    linkStream.listen((deepLink) {
      var uri = Uri.parse(deepLink!);
      if (uri.queryParameters.containsKey('Authority')) {
        String? authority = uri.queryParameters['Authority'];
        String? status = uri.queryParameters['Status'];
        print(authority);
        print(status);
        verifyPayment(status: status!,
            authority: authority!,
            paymentRequest: _paymentRequest);
      }
    });

    return _paymentRequest;
  }

  @override
  startPay({required PaymentRequest paymentRequest}) {
    ZarinPal().startPayment(paymentRequest, (status, paymentGatewayUri) {
      if (status == 100) {
        //User got to BankPort web view
        launchUrl(Uri.parse(paymentGatewayUri!),
            mode: LaunchMode.inAppBrowserView);
      }
    });
  }

  @override
  PaymentStatus verifyPayment({
    required String status,
    required String authority,
    required PaymentRequest paymentRequest}) {
    PaymentStatus paymentStatus = PaymentStatus.None;
    ZarinPal().verificationPayment(status, authority, paymentRequest,
            (isPaymentSuccess, refID, paymentRequest) {
          if (isPaymentSuccess) {
            paymentStatus = PaymentStatus.Success;
            print(refID);
          } else {
            paymentStatus = PaymentStatus.Fail;
          }
        });
    return paymentStatus;
  }
}

enum PaymentStatus { Success, Fail, None }
