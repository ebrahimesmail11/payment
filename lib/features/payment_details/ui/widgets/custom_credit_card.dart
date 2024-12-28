import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({required this.autovalidateMode ,required this.formKey, super.key});
final   GlobalKey<FormState> formKey;
final AutovalidateMode autovalidateMode;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  bool showBackView = false;
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (p0) {},
        ),
        CreditCardForm(
          autovalidateMode: widget.autovalidateMode,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (p0){
              cardNumber=p0.cardNumber;
              expiryDate=p0.expiryDate;
              cardHolderName=p0.cardHolderName;
              cvvCode=p0.cvvCode;
              showBackView=p0.isCvvFocused;
              setState(() {
                
              });
            },
            formKey:widget.formKey,),
      ],
    );
  }
}
