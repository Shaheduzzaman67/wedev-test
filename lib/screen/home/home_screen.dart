import 'package:flutter/material.dart';
import 'package:wedev_test/const/local_color.dart';
import 'package:wedev_test/screen/login/controller/login_controller.dart';

import 'package:wedev_test/screen/registration/signup_screen.dart';
import 'package:wedev_test/screen/update/update_screen.dart';
import 'package:wedev_test/screen/widget/custom_button.dart';
import 'package:wedev_test/screen/widget/custom_text.dart';
import 'package:wedev_test/screen/widget/custom_text_field.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldtext("Home Page", textColor: white),
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
            boldtext("Hi ${loginController.name}", textColor: black),
            SizedBox(
              height: 10,
            ),
            CustomLargeButton(
              btnText: "Update Profile",
              btnColor: grey,
              txtColor: white,
              onTap: () {
                Get.to(UpdateScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
