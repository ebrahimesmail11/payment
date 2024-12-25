import 'package:flutter/material.dart';
import 'package:payment/core/widgets/custom_app_bar.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'My Cart'),
      body: Column(
        children: [],
      ),
    );
  }
}
