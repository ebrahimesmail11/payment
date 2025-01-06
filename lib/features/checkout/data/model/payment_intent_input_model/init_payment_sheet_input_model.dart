class InitPaymentSheetInputModel {
  InitPaymentSheetInputModel({
    required this.clientSecret,
    required this.ephemeralKeySecret,
    required this.customerId,
  });
  final String clientSecret;
  final String ephemeralKeySecret;
  final String customerId;
}