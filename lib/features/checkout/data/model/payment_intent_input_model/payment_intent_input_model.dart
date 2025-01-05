class PaymentIntentInputModel {
  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
  });
  Map<String, dynamic> toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
    };
  }

  final String amount;
  final String currency;
}
