import 'package:flutter/material.dart';
import 'package:payment/core/theming/styles.dart';

class PaymentItemInfoData extends StatelessWidget {
  const PaymentItemInfoData(
      {required this.title, required this.value, super.key});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Styles.style18,
            ),
            Text(
              value,
              style: Styles.styleBold18,
            ),
          ],
        ),
      ],
    );
  }
}
