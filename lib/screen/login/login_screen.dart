import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedev_test/const/local_color.dart';
import 'package:wedev_test/const/local_images.dart';
import 'package:wedev_test/screen/home/home_screen.dart';
import 'package:wedev_test/screen/login/controller/login_controller.dart';

import 'package:wedev_test/screen/registration/signup_screen.dart';
import 'package:wedev_test/screen/widget/custom_button.dart';
import 'package:wedev_test/screen/widget/custom_text.dart';
import 'package:wedev_test/screen/widget/custom_text_field.dart';
import 'package:get/get.dart';
import 'package:wedev_test/screen/widget/password_text_filed.dart';
import 'package:wedev_test/services/session.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              logo,
              height: 100,
              fit: BoxFit.contain,
            ),
            boldtext("Login", fontSize: 25),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: loginController.userameController,
              hintTxt: "Email or Phone",
            ),
            SizedBox(
              height: 20,
            ),
            PasswordTextFiled(
              controller: loginController.passController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "password_name_req".tr;
                }

                return null;
              },
              label: 'Password',
            ),
            SizedBox(
              height: 20,
            ),
            CustomLargeButton(
              btnText: "Login",
              btnColor: red,
              txtColor: white,
              onTap: () {
                  Get.to(HomeScreen());
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                text("Forgot Password?", textColor: black),
                Spacer(),
                boldtext("Sign up", textColor: red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
