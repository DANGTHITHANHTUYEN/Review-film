import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:review_film/constaints/global_variables.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController filmNameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController castController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  color: GlobalVariables.appbarColor,
                  // gradient: GlobalVariables.appBarGrandient,
                ),
              ),
              title: const Text('Add Product',
                  style: TextStyle(
                    color: Colors.black,
                  ))),
        ),
        body: SingleChildScrollView(
          child: Form(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10, 4],
                  strokeCap: StrokeCap.round,
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.folder_open, size: 40),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Select Product Images',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade400,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
        ));
  }
}
