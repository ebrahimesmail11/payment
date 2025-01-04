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
    if (token == null) {
      throw Exception("Token is null");
    }
    final response = await networkService.post(
      body: paymentIntentInputModel.toJson(),
      url: AppConstant.url,
      token: token,
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
   await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Ibrahim',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }
  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel})async{
    var paymentIntentModel=await createPaymentIntent(paymentIntentInputModel:paymentIntentInputModel, );
    await initPaymentSheet(paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
