///Server response model
class ServerResponseModel {
  int code;
  String message;

  ServerResponseModel({
    required this.code,
    required this.message,
  });

  factory ServerResponseModel.fromJson(Map<String, dynamic> json) {
    return ServerResponseModel(
      code: json['code'] as int,
      message: json['message'] as String,
    );
  }
}
