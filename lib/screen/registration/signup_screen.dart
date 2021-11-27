import 'package:flutter/material.dart';
import 'package:wedev_test/const/local_color.dart';
import 'package:wedev_test/screen/login/login_screen.dart';
import 'package:wedev_test/screen/registration/controller/signup_controller.dart';
import 'package:wedev_test/screen/widget/custom_button.dart';
import 'package:wedev_test/screen/widget/custom_text.dart';
import 'package:wedev_test/screen/widget/custom_text_field.dart';
import 'package:get/get.dart';
import 'package:wedev_test/services/session.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  RegistrationController registrationController =
      Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    double height = 10;
    return Scaffold(
      appBar: AppBar(
        title: boldtext("Sign up", textColor: white),
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
              controller: registrationController.usernameController,
              hintTxt: "Username",
            ),
            SizedBox(
              height: height,
            ),
            CustomTextField(
              controller: registrationController.emailController,
              hintTxt: "Email",
            ),
            SizedBox(
              height: height,
            ),
            CustomTextField(
              controller: registrationController.passController,
              hintTxt: "Password",
            ),
            SizedBox(
              height: height,
            ),
            CustomLargeButton(
              btnText: "Sign up",
              btnColor: grey,
              txtColor: white,
              onTap: () {
                registrationController.callApiRegistration(callbackDone: () {
                  Get.to(LoginScreen());
                  debugPrint("done");
                });
              },
            ),
            SizedBox(
              height: height,
            ),
            boldtext("Already have an account?", textColor: black),
            SizedBox(
              height: height,
            ),
            CustomLargeButton(
              btnText: "Sign in",
              btnColor: grey,
              txtColor: white,
              onTap: () {
                Session.shared.hideLoading();
                Get.to(LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
