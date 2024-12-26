import 'package:flutter/material.dart';
import 'package:payment/core/routing/routes.dart';
import 'package:payment/features/checkout/ui/my_cart_screen.dart';
import 'package:payment/features/payment_details/ui/payment_details_screen.dart';

class RouteManger {
  Route? generateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case Routes.myCart:
        return MaterialPageRoute(
          builder: (_) => const MyCartScreen(),
        );
        case Routes.paymentDetails:
        return MaterialPageRoute(
          builder: (_) => const PaymentDetailsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}