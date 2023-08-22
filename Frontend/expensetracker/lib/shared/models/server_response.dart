class ResponseModel {
  int code; 
  String message;

  ResponseModel({
    required this.code,
    required this.message,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      code: json['code'] as int,
      message: json['message'] as String,
    );
  }
}
