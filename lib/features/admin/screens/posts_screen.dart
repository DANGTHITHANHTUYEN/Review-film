import 'package:flutter/material.dart';
import 'package:review_film/features/account/services/account_services.dart';
import 'package:review_film/features/account/widgets/account_button.dart';
import 'package:review_film/features/admin/screens/add_product_screen.dart';
import 'package:review_film/features/auth/services/auth_service.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const  Center(
            child: Text('Products'),
          ),
          Container(
        margin:const  EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.0),
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black12.withOpacity(0.03),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed:() => AccountServices().logOut(context),
          child: const Text(
           'logOut',
            style:  TextStyle(
                color: Colors.black, fontWeight: FontWeight.normal),
          ),
        ),
      ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add a Product',
        onPressed: navigateToAddProduct,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
