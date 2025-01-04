import 'package:get_it/get_it.dart';
import 'package:payment/core/netwoking/api_service.dart';
import 'package:payment/core/netwoking/network_service.dart';
import 'package:payment/features/checkout/cubit/payment_cubit.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo.dart';

final getIt = GetIt.instance;
Future<void> setUpGetIt() async {
  getIt.registerLazySingleton<NetworkService>(NetworkService.new);
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt()));
  getIt.registerLazySingleton<CheckoutRepo>(() => CheckoutRepo(getIt()));
  getIt.registerFactory<PaymentCubit>(() => PaymentCubit(getIt()));
}
