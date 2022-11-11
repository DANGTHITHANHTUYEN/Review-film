import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 50,
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 2),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          icon: icon,
        ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Enter your $hintText';
          }
          return null;
        },
      ),
    );
  }
}
