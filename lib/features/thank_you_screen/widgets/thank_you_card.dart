import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/theming/styles.dart';
import 'package:payment/features/checkout/ui/widgets/total_price.dart';
import 'package:payment/features/thank_you_screen/widgets/card_info_widget.dart';
import 'package:payment/features/thank_you_screen/widgets/payment_item_info_data.dart';
import 'package:payment/features/thank_you_screen/widgets/section_barcode.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60.h, right: 22.w, left: 22.w),
      decoration: ShapeDecoration(
        color: Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Thank you!',
            textAlign: TextAlign.center,
            style: Styles.style25,
          ),
          Text(
            'Your transaction was successful',
            textAlign: TextAlign.center,
            style: Styles.style20,
          ),
          42.verticalSpace,
          const PaymentItemInfoData(
            title: 'Data',
            value: '01/24/2023',
          ),
          20.verticalSpace,
          const PaymentItemInfoData(
            title: 'Time',
            value: '10:15 AM',
          ),
          20.verticalSpace,
          const PaymentItemInfoData(
            title: 'To',
            value: 'Sam Louis',
          ),
          30.verticalSpace,
          Divider(
            thickness: 2,
            height: 60.h,
          ),
          const TotalPrice(
            title: 'Total',
            value: '\$50.97',
          ),
          const CardInfoWidget(),
          const Spacer(),
          const SectionBarcode(),
          SizedBox(height: MediaQuery.sizeOf(context).height * .07),
        ],
      ),
    );
  }
}
