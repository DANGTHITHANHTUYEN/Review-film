import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_film/common/widgets/bottom_bar.dart';
import 'package:review_film/constaints/error_handling.dart';
import 'package:review_film/constaints/global_variables.dart';
import 'package:review_film/constaints/utils.dart';
import 'package:review_film/features/auth/screens/login_screen.dart';
import 'package:review_film/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:review_film/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void registerUser({
    required BuildContext context,
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        phone: phone,
        password: password,
        role: '',
        token: '',
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/register'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account create! Login with the same credentials! ',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // login user
  void loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // print(res.body);

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          // ignore: use_build_context_synchronously
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
              context, BottomBar.routeName, (route) => false);
          // HomeScreen
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //get user data
  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );
      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        //get user data
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        // ignore: use_build_context_synchronously
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  
}
