import 'package:flutter/material.dart';
import 'package:review_film/common/widgets/custom_button.dart';
import 'package:review_film/common/widgets/custom_textfield.dart';
import 'package:review_film/constaints/global_variables.dart';
import 'package:review_film/features/auth/screens/register_screen.dart';
import 'package:review_film/features/auth/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() {
    authService.loginUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Color.fromARGB(255, 109, 146, 240),
                    Color.fromARGB(255, 109, 127, 241),
                  ],
                ),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(100)),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/logo.png'),
                        radius: 70,
                      ),
                    ),
                    Spacer(),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 32, right: 32),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        )),
                  ]),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 62),
              child: Column(
                children: [
                  Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          icon: const Icon(Icons.email),
                        ),
                        const SizedBox(height: 15),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          icon: const Icon(Icons.key),
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, right: 32),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: const BoxDecoration(
                          gradient: GlobalVariables.appBarGrandient,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: CustomButton(
                          text: 'Login',
                          onTap: () {
                            if (_loginFormKey.currentState!.validate()) {
                              loginUser();
                            }
                          })),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Do you have an account?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                            onPressed: () {
                              // Navigator.pop(context);
                              Navigator.pushNamed(
                                    context, RegisterScreen.routeName);
                            },
                            child: const Text('Register'))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
