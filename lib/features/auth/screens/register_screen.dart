import 'package:flutter/material.dart';
import 'package:review_film/common/widgets/custom_button.dart';
import 'package:review_film/common/widgets/custom_textfield.dart';
import 'package:review_film/constaints/global_variables.dart';
import 'package:review_film/features/auth/screens/login_screen.dart';
import 'package:review_film/features/auth/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register-screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  void registerUser() {
    authService.registerUser(
      context: context,
      name: _nameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
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
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
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
                        radius: 80,
                      ),
                    ),
                    Spacer(),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 32, right: 32),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        )),
                  ]),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.7,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 28),
              child: Column(
                children: [
                  Form(
                    key: _registerFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Fullname',
                          icon: const Icon(Icons.person_outline),
                        ),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          icon: const Icon(Icons.email),
                        ),
                        CustomTextField(
                          controller: _phoneController,
                          hintText: 'Phone',
                          icon: const Icon(Icons.phone),
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          icon: const Icon(Icons.key),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.2,
                      margin: const EdgeInsets.only(top: 30),
                      decoration: const BoxDecoration(
                        gradient: GlobalVariables.appBarGrandient,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: CustomButton(
                        text: 'Register',
                        onTap: () {
                          if (_registerFormKey.currentState!.validate()) {
                            registerUser();
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          }
                        },
                      )),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'You are already registered?',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, LoginScreen.routeName);
                              },
                              child: const Text('Login'))
                        ]),
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
