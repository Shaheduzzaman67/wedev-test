
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wedev_test/configs/strings.dart';
import 'package:wedev_test/configs/config_setting.dart';




class Session {
  final box = GetStorage();
  static final Session _singleton = Session._internal();
  static Session get shared => _singleton;
  factory Session() {
    return _singleton;
  }
  Session._internal();

  var baseURL = ConfigSetting.baseURLFirstload;

  getBaseURL() {
    if (baseURL.endsWith('/')) {
      return baseURL;
    } else {
      return baseURL + '/';
    }
  }



  convertToInt({dynamic data}) {
    if (data is String) {
      return int.tryParse(data) ?? 0;
    }
    if (data is int) {
      return data;
    }
  }

  showLoading() {
    if (!EasyLoading.isShow) {
      EasyLoading.show();
    }
  }
  hideLoading() {
    EasyLoading.dismiss();
  }

  getToken() async {
    var tk = await box.read(Strings.token) ?? "";
    print("🍎 token from box! $tk");
    ConfigSetting.token = tk;
    return tk;
  }

  saveToken(String newToken) async {
    ConfigSetting.token = newToken;
    box.write(Strings.token, newToken);
    print("🍎saved token to box! $newToken");
  }

}
