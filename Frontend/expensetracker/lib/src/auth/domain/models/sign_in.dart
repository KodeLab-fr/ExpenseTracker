import 'dart:convert';

///Request model for the login get to the api. Its role is to convert the informations needed to json.
class SignInInfo {
  String name;
  String password;

  SignInInfo({
    required this.name,
    required this.password,
  });

  factory SignInInfo.fromJson(String source) =>
      SignInInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  factory SignInInfo.fromMap(Map<String, dynamic> map) {
    return SignInInfo(
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
