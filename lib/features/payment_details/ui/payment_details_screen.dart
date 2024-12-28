import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/helpers/extension.dart';
import 'package:payment/core/routing/routes.dart';
import 'package:payment/core/theming/styles.dart';
import 'package:payment/core/widgets/app_text_button.dart';
import 'package:payment/core/widgets/custom_app_bar.dart';
import 'package:payment/features/payment_details/ui/widgets/custom_credit_card.dart';
import 'package:payment/features/payment_details/ui/widgets/payment_methods_list_view.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
   GlobalKey<FormState> formKey = GlobalKey();
   AutovalidateMode autovalidateMode =AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment Details',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: PaymentMethodsListView(),
            ),
            SliverToBoxAdapter(
              child: CustomCreditCard(
                autovalidateMode: autovalidateMode,
                formKey: formKey,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: AppTextButton(
                      buttonText: 'Payment',
                      textStyle: Styles.style22,
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save();
                        }else{
                          context.pushNamed(Routes.thankYou);
                          autovalidateMode=AutovalidateMode.always;
                          setState(() {
                            
                          });
                        }
                      },
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
