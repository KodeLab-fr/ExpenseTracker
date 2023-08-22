class SignUpInfo {
  String username;
  String email;
  String password;

  SignUpInfo({
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, String> toJson() {
    Map<String, String> map = {
      'username': username,
      'email': email,
      'password': password,
    };
    return map;
  }

  @override
  String toString() {
    return 'name: $username, email: $email, password: $password';
  }
}
