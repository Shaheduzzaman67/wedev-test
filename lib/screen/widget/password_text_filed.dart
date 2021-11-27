import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wedev_test/const/local_color.dart';
import 'package:wedev_test/const/local_images.dart';


class PasswordTextFiled extends StatefulWidget {
  TextEditingController controller;
  FormFieldValidator<String> validator;
  String label;

  PasswordTextFiled({
    required this.controller,
    required this.validator,
    required this.label,

  });

  @override
  _PasswordTextFiledState createState() => _PasswordTextFiledState();
}

class _PasswordTextFiledState extends State<PasswordTextFiled> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    double borderRadius = 25;
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: !_passwordVisible,
      keyboardType: TextInputType.text,
      style: TextStyle(color: textColorPrimary),
      decoration: InputDecoration(
        hintText: widget.label == null ? "enter_password".tr : widget.label,
        //labelText: widget.label == null ? "enter_password".tr : widget.label,
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(0.5),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
                _passwordVisible ? eyeRed : eyeClose,
              height: 10,
              width: 10,
              fit: BoxFit.contain,
              color: _passwordVisible? red : Colors.grey,

            ),
          ),
        ),

        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
        ),
      ),
    );
  }
}
