import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wedev_test/configs/url_app.dart';
import 'package:wedev_test/services/network_api.dart';
import 'package:wedev_test/services/session.dart';


class UserUpdateController extends GetxController {

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }


  callApi({@required Function()? callbackDone}) async {


    if(passController.text.isEmpty || passController.text.length < 6 ){
      EasyLoading.showError("Password 6 character required");
      return;
    }

    print("start registration");
    Session.shared.showLoading();
    var formData = Dio.FormData();
    formData.fields.add(MapEntry('username', usernameController.text));
    formData.fields.add(MapEntry('email', emailController.text));
    formData.fields.add(MapEntry('password', passController.text));

    debugPrint(formData.fields.toString());

    var network = NetworkAPI(
      endpoint: url_signup,
      formData: formData,
      jsonQuery: {"": ""},
    );
    var jsonBody = await network.callAPI(
      method: "POST",
    );
    Session.shared.hideLoading();

    if(jsonBody["code"] == 200) {
      try {

        print("success $jsonBody");
        EasyLoading.showSuccess(jsonBody["message"]);
        callbackDone!();
        //refresh
      } on Exception catch (e) {
        EasyLoading.showError(jsonBody["message"]);
      }
    }else{
      EasyLoading.showError(jsonBody["message"]);
    }
  }
}
