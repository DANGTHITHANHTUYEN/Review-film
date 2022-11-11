import 'package:flutter/material.dart';
import 'package:review_film/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    phone: '',
    password: '',
    role: '',
    token: '',
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
