import 'dart:convert';

/// Request model for the login get to the api. Its role is to convert the informations needed to json.
class SignInInfo {
  String name;
  String password;

  SignInInfo({
    required this.name,
    required this.password,
  });

  //TODO : complete this model
  Map<String, String> toJson() {
    Map<String, String> map = {
      'authorization': 'Basic ${base64Encode('$name:$password'.codeUnits)}'
    };
    return map;
  }

  @override
  String toString() {
    return 'name: $name, password: $password';
  }
}
