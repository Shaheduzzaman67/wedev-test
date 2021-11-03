import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';
import 'package:wedev_test/services/session.dart';


var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    printTime: true,
  ),
);

class NetworkAPI {
  var endpoint = "";
  Map<String, dynamic> jsonQuery = {};
  FormData formData;
  NetworkAPI({
    required this.endpoint,
    required this.jsonQuery,
    required this.formData,
  });

  var dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: Session.shared.getBaseURL(),
      connectTimeout: 500000,
      receiveTimeout: 500000,
    ),
  );

  Future callAPIGET({showLog = false, keepKeyboard = false}) async {
    return callAPI(
      showLog: showLog,
      keepKeyboard: keepKeyboard,
      method: "GET",
    );
  }

  Future callAPIPOST({showLog = false, keepKeyboard = false}) async {
    return callAPI(
      showLog: showLog,
      keepKeyboard: keepKeyboard,
    );
  }

  Future callAPI(
      {method = "POST",
      showLog = false,
      keepKeyboard = false,
      Function(double)? percent}) async {
    if (keepKeyboard == false) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }

    Response response;
    var fullUrl = '${Session.shared.getBaseURL()}$endpoint';
    var token = await Session.shared.getToken();
    dio.options.headers["Authorization"] = "Bearer $token";
    print("jsonQuery: $jsonQuery");
    try {
      if (method == "POST") {
        print('formData ${formData.fields}');
        response = await dio.post(
          endpoint,
          queryParameters: jsonQuery,
          data: formData,
          onSendProgress: (int sent, int total) {
            if (percent != null) {
              var perCent = sent.toDouble() / total.toDouble();
              percent(perCent);
            }
          },
        );
      } else if (method == "POST-BODY") {
        print('formData ${formData.fields}');
        response = await dio.post(
          endpoint,
          data: jsonQuery,
          onSendProgress: (int sent, int total) {
            if (percent != null) {
              var perCent = sent.toDouble() / total.toDouble();
              percent(perCent);
            }
          },
        );
      } else if (method == "PATCH") {
        print('formData ${formData.fields}');
        response = await dio.patch(
          endpoint,
          queryParameters: jsonQuery,
          data: formData,
          onSendProgress: (int sent, int total) {
            if (percent != null) {
              var perCent = sent.toDouble() / total.toDouble();
              percent(perCent);
            }
          },
        );
      } else if (method == "DELETE") {
        response = await dio.delete(endpoint,
            data: formData, queryParameters: jsonQuery);

      } else if (method == "PUT") {
        response = await dio.put(
          endpoint,
          queryParameters: jsonQuery,
          data: jsonQuery,
          onSendProgress: (int sent, int total) {
            if (percent != null) {
              var perCent = sent.toDouble() / total.toDouble();
              percent(perCent);
            }
          },
        );
      }else {
        if (jsonQuery != null) {
          response = await dio.get(endpoint, queryParameters: jsonQuery);
          print(response);
        } else {
          response = await dio.get(endpoint);
        }
      }

      if (showLog) {
        logger.d(jsonQuery);
        logger.d(response.data);
      }
      print(" 🍌 FullURL: ${response.realUri}");

      if (response.statusCode == 200) {
        print("$fullUrl ✅");
        return response.data;
      } else {
        EasyLoading.showError(response.statusCode == 401 ? "Unauthorised" : "Invalid Request");
        return;
      }
    } on DioError catch (e) {
      Session.shared.hideLoading();
      print("❌❌ error PURE $endpoint ${e}");
      EasyLoading.showError(e.response!.statusCode == 401 ? "Unauthorised" : "Invalid Request");
      return e;
    }
  }
}
