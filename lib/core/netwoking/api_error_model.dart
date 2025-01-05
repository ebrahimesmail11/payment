class ApiErrorModel {
  ApiErrorModel({this.error});
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      error: json['error'] == null ? null : Error.fromJson(json["error"]),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'error': error?.toJson(),
    };
  }

  final Error? error;
}

class Error {
  Error({this.message});
  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      message: json['message'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }

  final String? message;
}
