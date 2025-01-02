import 'package:flutter/material.dart';

class CustomDashLined extends StatelessWidget {
  const CustomDashLined({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          30,
          (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    height: 2,
                    color: Color(0xFFB7B7B7),
                  ),
                ),
              )),
    );
  }
}
