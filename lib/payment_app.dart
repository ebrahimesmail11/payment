import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/routing/route_manger.dart';
import 'package:payment/core/routing/routes.dart';

class PaymentApp extends StatelessWidget {
  const PaymentApp({required this.appRoute, super.key});
  final RouteManger appRoute;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Payment App',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.myCart,
        onGenerateRoute: appRoute.generateRoute,
      ),
    );
  }
}
