import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/features/checkout/ui/my_cart_screen.dart';

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Payment App',
        debugShowCheckedModeBanner: false,   
        home:MyCartScreen(),
      ),
    );
  }
}