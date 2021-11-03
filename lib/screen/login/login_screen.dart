import 'package:flutter/material.dart';
import 'package:wedev_test/const/local_color.dart';
import 'package:wedev_test/screen/home/home_screen.dart';
import 'package:wedev_test/screen/login/controller/login_controller.dart';

import 'package:wedev_test/screen/registration/signup_screen.dart';
import 'package:wedev_test/screen/widget/custom_button.dart';
import 'package:wedev_test/screen/widget/custom_text.dart';
import 'package:wedev_test/screen/widget/custom_text_field.dart';
import 'package:get/get.dart';
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
      appBar: AppBar(
        title: boldtext("Login", textColor: white),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              controller: loginController.userameController,
              labelTxt: 'Enter Your username',
              hintTxt: "Username",
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: loginController.passController,
              labelTxt: 'Enter Your Password',
              hintTxt: "Password",
            ),
            SizedBox(
              height: 20,
            ),
            CustomLargeButton(
              btnText: "Sign in",
              btnColor: grey,
              txtColor: white,onTap: (){ loginController.callApiLogin(callbackDone: () {
              Get.to(HomeScreen());
              debugPrint("done");
            });},
            ),
            SizedBox(
              height: 10,
            ),
            boldtext("Do not have account?", textColor: black),
            SizedBox(
              height: 10,
            ),
            CustomLargeButton(
              btnText: "Sign up",
              btnColor: grey,
              txtColor: white,onTap: (){

              Session.shared.hideLoading();

              Get.to(SignupScreen());},
            ),
          ],
        ),
      ),
    );
  }
}
