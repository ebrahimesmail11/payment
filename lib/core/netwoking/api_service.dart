import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/helpers/app_constant.dart';
import 'package:payment/core/netwoking/network_service.dart';
import 'package:payment/features/checkout/data/model/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment/features/checkout/data/model/payment_intent_model/payment_intent_model.dart';

class ApiService {
  ApiService(this.networkService);
  final NetworkService networkService;
  Future<PaymentIntentModel> createPaymentIntent({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    final token = dotenv.env['TOKEN_SECRET_KEY'];
    final response = await networkService.post(
      body: paymentIntentInputModel.toJson(),
      url: AppConstant.url,
      token: token.toString(),
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters:  SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Ibrahim',
      ),
    );
  }
}
