import 'package:flutter/material.dart';
import 'package:payment/features/thank_you_screen/widgets/custom_check_icon.dart';
import 'package:payment/features/thank_you_screen/widgets/custom_dash_lined.dart';
import 'package:payment/features/thank_you_screen/widgets/thank_you_card.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            left: 20 + 8,
            right: 20 + 8,
            child: const CustomDashLined(),
          ),
          Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: const CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}
