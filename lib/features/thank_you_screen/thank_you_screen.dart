import 'package:flutter/material.dart';
import 'package:payment/features/thank_you_screen/widgets/thank_you_body.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:SafeArea(child: ThankYouBody()),
    );
  }
}