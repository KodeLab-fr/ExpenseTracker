import 'dart:convert';

///Request model for the login get to the api. Its role is to convert the informations needed to json.
class LoginInfo {
  String name;
  String password;

  LoginInfo({
    required this.name,
    required this.password,
  });

  factory LoginInfo.fromJson(String source) =>
      LoginInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  factory LoginInfo.fromMap(Map<String, dynamic> map) {
    return LoginInfo(
      name: map['name'] as String,
      password: map['password'] as String,
    );
  }

  Map<String, String> toMap() {
    Map<String, String> map = {
      'authorization': 'Basic ${base64Encode('$name:$password'.codeUnits)}'
    };
    return map;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'name: $name, password: $password';
  }
}
