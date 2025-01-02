import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/theming/styles.dart';
import 'package:payment/core/widgets/app_text_button.dart';
import 'package:payment/core/widgets/custom_app_bar.dart';
import 'package:payment/features/checkout/ui/widgets/order_info_item.dart';
import 'package:payment/features/checkout/ui/widgets/payment_method_bottom_sheet.dart';
import 'package:payment/features/checkout/ui/widgets/total_price.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Cart'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/images/basket_image.png'),
            ),
            25.verticalSpace,
            OrderInfoItem(
              title: 'Order Subtotal',
              value: '\$42.97',
            ),
            3.verticalSpace,
            OrderInfoItem(
              title: 'Discount',
              value: '\$0',
            ),
            3.verticalSpace,
            OrderInfoItem(
              title: 'Shipping',
              value: '\$8',
            ),
            Divider(
              indent: 12,
              endIndent: 12,
              thickness: 2,
              height: 30.h,
              color: Color(0xFFC6C6C6),
            ),
            15.verticalSpace,
            TotalPrice(
              title: 'Total',
              value: '\$50.97',
            ),
            16.verticalSpace,
            AppTextButton(
              buttonText: 'Complete Payment',
              textStyle: Styles.style22,
              onPressed: () {
                // context.pushNamed(Routes.paymentDetails);
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    context: context,
                    builder: (context) {
                      return const PaymentMethodsBottomSheet();
                    });
              },
            ),
            12.verticalSpace,
          ],
        ),
      ),
    );
  }
}
