import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/features/payment_details/ui/widgets/payment_details_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
 final  List<String> paymentMethods = const [
    'assets/images/credit_card.svg',
    'assets/images/paypal.svg',
    // 'assets/images/apple_pay.svg',
  ];
  int activeIndex =0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: ListView.separated(
        itemCount: paymentMethods.length,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => 20.horizontalSpace,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                activeIndex = index;
              });
            },
            child: PaymentDetailsItem(
              image: paymentMethods[index],
              isActive: activeIndex == index,
            ),
          );
        },
      ),
    );
  }
}
