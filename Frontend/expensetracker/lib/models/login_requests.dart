import 'dart:convert';

class LoginRequestModel {
  String name;
  String password;

  LoginRequestModel({
    required this.name,
    required this.password,
  });

  Map<String, String> toJson() {
    Map<String, String> map = {
      'authorization': 'Basic ${base64Encode('$name:$password'.codeUnits)}'
    };
    return map;
  }
}

class LoginResponseModel {
  final String? token;

  LoginResponseModel({
    this.token,
  });

  factory LoginResponseModel.fromJson(String json) {
    return LoginResponseModel(
      token: jsonDecode(json) ?? " ",
    );
  }
}
