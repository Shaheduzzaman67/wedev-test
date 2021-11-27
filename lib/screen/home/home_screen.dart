import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedev_test/const/local_color.dart';
import 'package:wedev_test/const/local_images.dart';
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
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SvgPicture.asset(
            logo,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: boldtext("Balance", fontSize: 20, textColor: Colors.white),
          ),
          preferredSize: Size.fromHeight(50.0),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(
              menu,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.search, color: grey.withOpacity(0.5), size: 25,),
                  SizedBox(width: 10,),
                  text("Search", textColor: grey.withOpacity(0.5), fontSize: 15),
                  Spacer(),
                  SvgPicture.asset(
                    listGrey,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 10,),
                  SvgPicture.asset(
                    gridBlack,
                    height: 20,
                    fit: BoxFit.contain,
                  ),

                ],
              ),
            ),

            Container(
              width: Get.width,
              padding: EdgeInsets.all(10),
              decoration: new BoxDecoration(
                color: white,
                borderRadius: new BorderRadius.all(
                  Radius.circular(05),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset:
                    Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        php,
                        height: 25,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10,),
                      boldtext("PHP"),
                      Spacer(),
                      SvgPicture.asset(
                        pullDown,
                        height: 20,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  SizedBox(height:Get.height * 0.01),
                  Padding(
                    padding:  EdgeInsets.only(left: Get.width * 0.08),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            text("Total", fontSize: 20, textColor: grey.withOpacity(0.5)),
                            Spacer(),
                            text("10,000,000.", fontSize: 20,),
                            text("0101", fontSize: 12, textColor: grey.withOpacity(0.5)),
                            SizedBox(width: 5,),
                            boldtext("PHP",fontSize: 12,),
                          ],
                        ),
                        SizedBox(height:Get.height * 0.01),
                        Row(
                          children: [
                            text("Available", fontSize: 15, textColor: grey.withOpacity(0.5)),
                            Spacer(),
                            text("10,000,000.", fontSize: 15,),
                            text("0101", fontSize: 12, textColor: grey.withOpacity(0.5)),
                          ],
                        ),
                        Row(
                          children: [
                            text("In order", fontSize: 15, textColor: grey.withOpacity(0.5)),
                            Spacer(),
                            text("0", fontSize: 15,),

                          ],
                        ),
                        Row(
                          children: [
                            text("Lock", fontSize: 15, textColor: grey.withOpacity(0.5)),
                            Spacer(),
                            text("0", fontSize: 15,),

                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
