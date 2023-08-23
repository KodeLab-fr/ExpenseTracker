

import 'dart:convert';

class SignUpInfo {
  String username;
  String email;
  String password;

  SignUpInfo({
    required this.username,
    required this.email,
    required this.password,
  });

  factory SignUpInfo.fromMap(Map<String, dynamic> map) {
    return SignUpInfo(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  factory SignUpInfo.fromJson(String source) =>
      SignUpInfo.fromMap(json.decode(source) as Map<String, dynamic>);

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
