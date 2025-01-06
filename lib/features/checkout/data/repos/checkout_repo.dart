import 'package:payment/core/netwoking/api_error_handler.dart';
import 'package:payment/core/netwoking/api_result.dart';
import 'package:payment/core/netwoking/api_service.dart';
import 'package:payment/features/checkout/data/model/payment_intent_input_model/payment_intent_input_model.dart';

class CheckoutRepo {
  CheckoutRepo(this._apiService);
  final ApiService _apiService;
  Future<ApiResult<void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await _apiService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle(e),
      );
    }
  }
}
