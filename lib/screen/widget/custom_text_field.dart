import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintTxt;
  final TextEditingController controller;

  const CustomTextField(
      {Key? key, required this.hintTxt, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          ),
          hintText: hintTxt,
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.5),
          )
        ),
      ),
    );
  }
}
