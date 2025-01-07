import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/helpers/app_constant.dart';
import 'package:payment/core/netwoking/network_service.dart';
import 'package:payment/features/checkout/data/model/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment/features/checkout/data/model/payment_intent_input_model/init_payment_sheet_input_model.dart';
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
      contentType: Headers.formUrlEncodedContentType,
      token: token,
    );
    log('response:::::::::$response');
    var intent = PaymentIntentModel.fromJson(response.data);
    log('intet::::::::::::::$intent');
    return intent;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'Ibrahim',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);

    InitPaymentSheetInputModel initPaymentSheetInputModel =
        InitPaymentSheetInputModel(
            clientSecret: paymentIntentModel.clientSecret!,
            ephemeralKeySecret: ephemeralKeyModel.secret!,
            customerId: paymentIntentInputModel.customerId);
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    final token = dotenv.env['TOKEN_SECRET_KEY'];
    if (token == null) {
      throw Exception("Token is null");
    }
    final response = await networkService.post(
        body: {
          'customer': customerId,
        },
        url: AppConstant.ephemeralKeyModel,
        contentType: Headers.formUrlEncodedContentType,
        token: token,
        headers: {
          'Authorization': 'Bearer $token',
          'Stripe-Version': '2024-12-18.acacia',
        });
    log('response:::::::::$response');
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    log('ephemeralKeyModel::::::::::::::$ephemeralKeyModel');
    return ephemeralKeyModel;
  }
}
