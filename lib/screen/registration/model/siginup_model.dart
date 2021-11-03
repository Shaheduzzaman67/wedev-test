

import 'package:wedev_test/configs/safe_convert.dart';

class SignupModel {
  final int code;
  final String message;

  SignupModel({
    this.code = 0,
    this.message = "",
  });

  factory SignupModel.fromJson(Map<String, dynamic>? json) => SignupModel(
    code: asInt(json, 'code'),
    message: asString(json, 'message'),
  );

  Map<String, dynamic> toJson() => {
    'code': this.code,
    'message': this.message,
  };
}

