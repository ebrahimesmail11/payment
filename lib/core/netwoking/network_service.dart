import 'package:dio/dio.dart';

class NetworkService {
  final Dio dio = Dio();
  Future<Response> post({
    required body,
    required String url,
    required String token,
    String? contentType,
  }) {
    final response = dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }
}
