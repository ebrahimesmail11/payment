part of 'payment_cubit.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;
  const factory PaymentState.loading() = Loading;
  const factory PaymentState.success() = Success;
  const factory PaymentState.failure({required String error}) = Failure;

}
