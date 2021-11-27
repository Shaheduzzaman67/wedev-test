import 'package:flutter/material.dart';
import 'package:wedev_test/const/local_color.dart';
import 'package:wedev_test/screen/home/home_screen.dart';
import 'package:wedev_test/screen/update/controller/userupdate_controller.dart';
import 'package:wedev_test/screen/widget/custom_button.dart';
import 'package:wedev_test/screen/widget/custom_text.dart';
import 'package:wedev_test/screen/widget/custom_text_field.dart';
import 'package:get/get.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {

  UserUpdateController userUpdateController = Get.put(UserUpdateController());

  @override
  Widget build(BuildContext context) {
    double height = 10;
    return Scaffold(
      appBar: AppBar(
        title: boldtext("Update Profile", textColor: white),
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
              controller: userUpdateController.usernameController,
              hintTxt: "name",
            ),
            SizedBox(
              height: height,
            ),
            CustomLargeButton(
              btnText: "Update Profile",
              btnColor: grey,
              txtColor: white,onTap: (){
              Get.off(HomeScreen());
            },
            ),

          ],
        ),
      ),
    );
  }
}
