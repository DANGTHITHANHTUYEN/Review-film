import 'package:flutter/material.dart';
import 'package:review_film/constaints/utils.dart';
import 'package:review_film/features/auth/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountServices {
  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token','');
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, LoginScreen.routeName, (route) => false);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
