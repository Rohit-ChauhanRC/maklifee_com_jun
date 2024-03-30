import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  //
  GlobalKey<FormState> loginFormKey = GlobalKey();

  final RxBool _circularProgress = true.obs;
  bool get circularProgress => _circularProgress.value;
  set circularProgress(bool v) => _circularProgress.value = v;

  final RxString _mobileNumber = ''.obs;
  String get mobileNumber => _mobileNumber.value;
  set mobileNumber(String mob) => _mobileNumber.value = mob;

  final RxString _inputUser = "Outlet".obs;
  String get inputUser => _inputUser.value;
  set inputUser(String str) => _inputUser.value = str;

  final listOfUser = ["Customer", "Franchiee", "Outlet"];

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
    // Utils.closeKeyboard();
    // if (!loginFormKey!.currentState!.validate()) {
    //   return null;
    // }
    // if (mobileNumber == "91234567890" && customerNumber == "123456") {
    //   await createProfile();
    // } else {
    //   await loginCred();
    // }
  }
}
