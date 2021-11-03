import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelTxt;
  final String hintTxt;
  final TextEditingController controller;

  const CustomTextField({Key? key, required this.labelTxt, required this.hintTxt, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            labelText: labelTxt,
            hintText: hintTxt),
      ),
    );
  }
}
