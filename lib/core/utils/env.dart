import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env{
  Env._();
  static final Env instance=Env._();
  String _tokenSecretKey='';
  Future<void> init()async{
     await dotenv.load(fileName: ".env");
       _tokenSecretKey=dotenv.get('TOKEN_SECRET_KEY');
  }
  String get tokenSecretKey=> _tokenSecretKey;
}