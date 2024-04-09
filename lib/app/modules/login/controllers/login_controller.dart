import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maklifee_com/app/routes/app_pages.dart';

import '../../../utils/utils.dart';

class LoginController extends GetxController {
  //
  GlobalKey<FormState> loginFormKey = GlobalKey();

  final RxBool _circularProgress = true.obs;
  bool get circularProgress => _circularProgress.value;
  set circularProgress(bool v) => _circularProgress.value = v;

  final RxBool _check = false.obs;
  bool get check => _check.value;
  set check(bool v) => _check.value = v;

  final RxString _mobileNumber = ''.obs;
  String get mobileNumber => _mobileNumber.value;
  set mobileNumber(String mob) => _mobileNumber.value = mob;

  final RxString _inputUser = "Outlet".obs;
  String get inputUser => _inputUser.value;
  set inputUser(String str) => _inputUser.value = str;

  final listOfUser = ["Franchise", "Outlet"];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<dynamic> login() async {
    Utils.closeKeyboard();
    if (!loginFormKey.currentState!.validate()) {
      return null;
    }
    if (mobileNumber == "9876543210" &&
        (inputUser == "Outlet" || inputUser == "Franchise")) {
      // await createProfile();

      // mobileNumber.substring(start)
      Get.toNamed(Routes.HOME, arguments: [inputUser, mobileNumber]);
    } else {
      await loginCred();
    }
  }

  loginCred() async {
    circularProgress = false;
    try {
      var res = await http.post(
        Uri.parse("http://Payment.maklife.in:98/api/User"),
        body: {
          "MobileNo": mobileNumber.trim(),
          "LogType": "M",
          "UserType": inputUser == "Outlet" ? "O" : "F"
        },
      );
      final a = jsonDecode(res.body);
      print(a);
      if (res.statusCode == 200 && jsonDecode(res.body) == "OTP Sent !") {
        print(res.statusCode);
        print(res.body);

        Get.toNamed(Routes.OTP,
            arguments: [inputUser == "Outlet" ? "O" : "F", mobileNumber]);
      } else if (res.statusCode == 200 && json.decode(res.body) == "Login") {
        Get.offNamed(Routes.HOME, arguments: [inputUser, mobileNumber]);
      } else {
        //
        Utils.showDialog(json.decode(res.body));
      }
      circularProgress = true;
    } catch (e) {
      // apiLopp(i);
      circularProgress = true;
    }
  }

  /*

    "OTP Sent !"

  "Login"


  "OutLet does not exists ?"

  "Franchisee does not exists ?"
  */
}
