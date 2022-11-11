import 'package:flutter/material.dart';
import 'package:review_film/constaints/global_variables.dart';
import 'package:review_film/features/account/widgets/below_app_bar.dart';
import 'package:review_film/features/account/widgets/orders.dart';
import 'package:review_film/features/account/widgets/top_button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: GlobalVariables.appbarColor,
              // gradient: GlobalVariables.appBarGrandient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 120,
                  height: 55,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(Icons.notification_add_outlined),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          BelowAppBar(),
          SizedBox(
            height: 10,
          ),
          TopButton(),
          SizedBox(
            height: 20,
          ),
          Orders(),
        ],
      ),
    );
  }
}
