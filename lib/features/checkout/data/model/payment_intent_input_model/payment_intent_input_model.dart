class PaymentIntentInputModel {
  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
  });
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
    };
  }

  final String amount;
  final String currency;
}
