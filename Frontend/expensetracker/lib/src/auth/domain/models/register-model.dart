import 'dart:convert';

class RegisterInfo {
  String username;
  String email;
  String password;

  RegisterInfo({
    required this.username,
    required this.email,
    required this.password,
  });

  factory RegisterInfo.fromMap(Map<String, dynamic> map) {
    return RegisterInfo(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  factory RegisterInfo.fromJson(String source) =>
      RegisterInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, String> toMap() {
    Map<String, String> map = {
      'username': username,
      'email': email,
      'password': password,
    };
    return map;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'name: $username, email: $email, password: $password';
  }
}
