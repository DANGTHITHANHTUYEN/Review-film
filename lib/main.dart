import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_film/common/widgets/bottom_bar.dart';
import 'package:review_film/constaints/global_variables.dart';
import 'package:review_film/features/admin/screens/admin_screen.dart';
import 'package:review_film/features/auth/screens/login_screen.dart';
import 'package:review_film/features/auth/screens/register_screen.dart';
import 'package:review_film/features/auth/services/auth_service.dart';
import 'package:review_film/providers/user_provider.dart';
import 'package:review_film/router.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    // ignore: avoid_single_cascade_in_expression_statements
    authService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Review Film',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ))),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      // home: const RegisterScreen() ,
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.role == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const LoginScreen(),
    );
  }
}
