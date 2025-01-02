import 'package:payment/core/helpers/app_constant.dart';
import 'package:payment/core/netwoking/network_service.dart';
import 'package:payment/features/checkout/data/model/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment/features/checkout/data/model/payment_intent_model/payment_intent_model.dart';

class ApiService {
  ApiService(this.networkService);
  final NetworkService networkService;
  Future<PaymentIntentModel> createPaymentIntent({
    required PaymentIntentInputModel paymentIntentInputModel,
  })async {
      final token = Env['TOKEN_SECRET_KEY'];
    final response =await networkService.post(
        body: paymentIntentInputModel.toJson(),
        url: AppConstant.url,
        token:token,
        );
  return  PaymentIntentModel.fromJson(response.data);
  
  }
}
