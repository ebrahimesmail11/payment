import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/features/checkout/ui/widgets/custom_button_bloc_consumer.dart';
import 'package:payment/features/payment_details/ui/widgets/payment_methods_list_view.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          16.verticalSpace,
         const PaymentMethodsListView(),
          32.verticalSpace,
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}

