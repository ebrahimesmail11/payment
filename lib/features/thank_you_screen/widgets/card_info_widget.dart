
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/theming/styles.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305.w,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 22.w),
      margin: EdgeInsets.symmetric(vertical: 30.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/images/master_card.svg'),
          23.horizontalSpace,
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Credit Card ',
                  style: Styles.style18,
                ),
                TextSpan(
                  text: 'Mastercard **78',
                  style: Styles.style20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
