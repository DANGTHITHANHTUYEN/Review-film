import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String role;
  final String token;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.role,
      required this.token});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'role': role,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      password: map['password'] ?? '',
      role: map['role'] ?? '',
      token: map['token'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
