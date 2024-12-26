import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/helpers/extension.dart';
import 'package:payment/core/widgets/custom_app_bar.dart';
import 'package:payment/features/payment_details/ui/widgets/payment_methods_list_view.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment Details',
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Center(
            child: SvgPicture.asset(
              'assets/images/arrow.svg',
              height: 24.h,
            ),
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            PaymentMethodsListView(),
          ],
        ),
      ),
    );
  }
}
