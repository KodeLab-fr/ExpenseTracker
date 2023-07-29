import 'dart:convert';

/// Request model for the login get to the api. Its role is to convert the informations needed to json.
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

/// Respone model for the login get to the api. Its role is to retrieve the response from the server.
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
