
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment/core/theming/styles.dart';

class SectionBarcode extends StatelessWidget {
  const SectionBarcode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          FontAwesomeIcons.barcode,
          size: 70,
        ),
        Container(
          width: 113.w,
          height: 58.h,
          margin: EdgeInsets.only(left: 50.w),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.50, color: Color(0xFF34A853)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              'PAID',
              textAlign: TextAlign.center,
              style: Styles.style24.copyWith(
                color:  Color(0xFF34A853),
              ),
            ),
          ),
        ),
      ],
    );
  }
}