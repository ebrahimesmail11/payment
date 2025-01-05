import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/di/dependency_injection.dart';
import 'package:payment/core/routing/route_manger.dart';
import 'package:payment/core/utils/env.dart';
import 'package:payment/payment_app.dart';

void main() async {
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  await Env.instance.init();
  await setUpGetIt();
  final publishableKey = dotenv.env['Publishable_Key'];
  if (publishableKey == null || publishableKey.isEmpty) {
    throw Exception('Publishable Key is not set. Please check your .env file.');
  }

  Stripe.publishableKey = publishableKey;
  runApp(DevicePreview(
      enabled: false,
      builder: (context) {
        return PaymentApp(
          appRoute: RouteManger(),
        );
      }));
}
