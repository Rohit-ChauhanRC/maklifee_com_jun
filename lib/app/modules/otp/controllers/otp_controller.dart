import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';
import '../../../utils/utils.dart';

class OtpController extends GetxController {
  //
  GlobalKey<FormState> loginFormKey = GlobalKey();

  final RxBool _circularProgress = true.obs;
  bool get circularProgress => _circularProgress.value;
  set circularProgress(bool v) => _circularProgress.value = v;

  final RxString _mobileNumber = ''.obs;
  String get mobileNumber => _mobileNumber.value;
  set mobileNumber(String mob) => _mobileNumber.value = mob;

  final RxString _otp = ''.obs;
  String get otp => _otp.value;
  set otp(String str) => _otp.value = str;

  final RxInt _count = 0.obs;
  int get count => _count.value;
  set count(int i) => _count.value = i;

  final RxBool _resend = true.obs;
  bool get resend => _resend.value;
  set resend(bool v) => _resend.value = v;

  @override
  void onInit() async {
    super.onInit();
    mobileNumber = Get.arguments[1];
    await counter();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> counter() async {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) async {
        if (count <= 80) count += 1;
        if (count == 80) {
          resend = true;
          count = 0;
          await resendOtp();
        }
      },
    );
  }

  // http://Payment.maklife.in:98/api/OTPValidation

  Future<dynamic> otpVerify() async {
    Utils.closeKeyboard();
    if (!loginFormKey.currentState!.validate()) {
      return null;
    }
    try {
      var res = await http.post(
        Uri.parse("http://Payment.maklife.in:98/api/OTPValidation"),
        body: {
          "MobileNo": Get.arguments[1].trim(),
          "OTP": otp.trim(),
          "UserType": Get.arguments[0]
        },
      );
      if (res.statusCode == 200) {
        if (jsonDecode(res.body) == "Success") {
          // await fetchUserData();
          Get.offNamed(Routes.HOME,
              arguments: [Get.arguments[0], Get.arguments[1].trim()]);
        } else if (jsonDecode(res.body) == "Invalid OTP ?") {
          // print('res.body');
          Utils.showDialog(jsonDecode(res.body));
        }
      }
      circularProgress = true;
    } catch (e) {
      // apiLopp(i);
      circularProgress = true;
    }
  }

  Future<dynamic> resendOtp() async {
    Utils.closeKeyboard();
    try {
      var res = await http.post(
        Uri.parse("http://Payment.maklife.in:98/api/user"),
        body: {
          "MobileNo": mobileNumber.trim(),
          "LogType": "M",
          "UserType": Get.arguments[0]
        },
      );
      final a = jsonDecode(res.body);
      if (res.statusCode == 200) {
      } else if (res.statusCode == 200 && json.decode(res.body) == "Login") {
        Get.offNamed(Routes.HOME, arguments: [
          Get.arguments[0] == "O" ? "Outlet" : "Franchiee",
          Get.arguments[1].trim()
        ]);
      }
      circularProgress = true;
    } catch (e) {
      // apiLopp(i);
      circularProgress = true;

      showModalBottomSheet<void>(
          context: Get.context!,
          builder: (_) {
            return Text(e.toString());
          });
    }
  }
}
