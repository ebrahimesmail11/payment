import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/helpers/extension.dart';
import 'package:payment/core/widgets/custom_app_bar.dart';
import 'package:payment/features/thank_you_screen/widgets/thank_you_body.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
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
      body: Transform.translate(offset: Offset(0, -30), child: ThankYouBody()),
    );
  }
}
