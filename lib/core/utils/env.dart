import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  Env._();
  static final Env instance = Env._();
  String _tokenSecretKey = '';
  String _publishableKey = '';
  String _clientId='';
  String _secretKey='';
  Future<void> init() async {
    await dotenv.load(fileName: ".env");
    _tokenSecretKey = dotenv.get('TOKEN_SECRET_KEY');
    _publishableKey = dotenv.get('Publishable_Key');
    _clientId=dotenv.get('CLIENT_ID');
    _secretKey=dotenv.get('SECRET_KEY');
  }

  String get tokenSecretKey => _tokenSecretKey;
  String get publishableKey => _publishableKey;
  String get clientId=>_clientId;
  String get secretKey=>_secretKey;
}
