 class ApiErrorModel {
  ApiErrorModel({this.errMessage});
  factory ApiErrorModel.fromJson(Map<String,dynamic> json){
    return ApiErrorModel(
      errMessage: json['errMessage']
    );
  }
  final String? errMessage;
}
