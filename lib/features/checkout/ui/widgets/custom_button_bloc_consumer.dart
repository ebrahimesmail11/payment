import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/helpers/extension.dart';
import 'package:payment/core/routing/routes.dart';
import 'package:payment/core/theming/styles.dart';
import 'package:payment/core/widgets/app_text_button.dart';
import 'package:payment/features/checkout/cubit/payment_cubit.dart';
import 'package:payment/features/checkout/data/model/amount_model/amount_model.dart';
import 'package:payment/features/checkout/data/model/amount_model/details.dart';
import 'package:payment/features/checkout/data/model/items_list_model/item.dart';
import 'package:payment/features/checkout/data/model/items_list_model/items_list_model.dart';
import 'package:payment/features/checkout/data/model/payment_intent_input_model/payment_intent_input_model.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.isPaypal,
  });
  final bool isPaypal;
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
        return state.maybeWhen(loading: () {
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
        }, orElse: () {
          return AppTextButton(
            buttonText: 'Continue',
            textStyle: Styles.style22,
            onPressed: () async {
              if (isPaypal) {
                exceuetePaypalPayment(
                  context,
                );
              } else {
                PaymentIntentInputModel paymentIntentInputModel =
                    PaymentIntentInputModel(
                  amount: '100',
                  currency: 'USD',
                  customerId: 'cus_RXLMCvILpTIqMB',
                );
                await context.read<PaymentCubit>().makePayment(
                    paymentIntentInputModel: paymentIntentInputModel);
              }
            },
          );
        });
      },
    );
  }

  void exceuetePaypalPayment(
    BuildContext context,
  ) {
    var transactions = gettransactionsData();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        // clientId: 'AZYkrt2NU2mGsuirMLC3kwBnoxTpphxUoKvigRidN7PePd5E3-KBD_fuwuRyAlDpq6bjUAtHJTDA17aF',
        clientId: dotenv.env['CLIENT_ID'],
        secretKey: dotenv.env['SECRET_KEY'],
        transactions: [
          {
            "amount": transactions.amountModel.toJson(),
            "description": "The payment transaction description.",
            "item_list": {
              //'items':
              //      transactions.itemsList.toJson(),
              "items":
                  transactions.itemsList.items!.map((e) => e.toJson()).toList(),
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          context.pushNamed(Routes.thankYou);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          log('cancelled:');
        },
      ),
    ));
  }

  ({AmountModel amountModel, ItemsListModel itemsList}) gettransactionsData() {
    var amountModel = AmountModel(
      total: "70",
      currency: "USD",
      details: Details(
        subtotal: "70",
        shipping: "0",
        shippingDiscount: 0,
      ),
    );
    List<OrderItem> orders = [
      OrderItem(
        name: 'Apple',
        quantity: 4,
        price: '5',
        currency: 'USD',
      ),
      OrderItem(
        name: 'Pineapple',
        quantity: 5,
        price: '10',
        currency: 'USD',
      ),
    ];
    var itemsList = ItemsListModel(
      items: orders,
    );
    return (amountModel: amountModel, itemsList: itemsList);
  }
}
