import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/helpers/extension.dart';
import 'package:payment/core/routing/routes.dart';
import 'package:payment/core/theming/styles.dart';
import 'package:payment/core/widgets/app_text_button.dart';
import 'package:payment/features/checkout/cubit/payment_cubit.dart';
import 'package:payment/features/checkout/data/model/payment_intent_input_model/payment_intent_input_model.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.pushReplacementNamed(Routes.thankYou);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Success')),
            );
          },
          failure: (error) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error),
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
          return Container(
            width: 350.w,
            height: 73.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(
                0xFF34A853,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          );
       }, 
        orElse: () {
          return AppTextButton(
            buttonText: 'Continue',
            textStyle: Styles.style22,
            onPressed: ()async {
              PaymentIntentInputModel paymentIntentInputModel=PaymentIntentInputModel(amount: '100',currency: 'USD');
             await context.read<PaymentCubit>().makePayment(paymentIntentInputModel: paymentIntentInputModel);
            },
          );
        });
      },
    );
  }
}
