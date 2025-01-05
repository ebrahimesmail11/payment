import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:payment/features/checkout/data/model/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo.dart';

part 'payment_state.dart';
part 'payment_cubit.freezed.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this._repo) : super(PaymentState.initial());
  final CheckoutRepo _repo;
  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentState.loading());
    final result = await _repo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    result.when(success: (data) {
      emit(
        PaymentState.success(),
      );
    }, failure: (error) {
      emit(
        PaymentState.failure(
          error: error.apiErrorModel.error?.message ?? '',
        ),
      );
    });
  }
  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString(),);
    super.onChange(change);
  }
}
