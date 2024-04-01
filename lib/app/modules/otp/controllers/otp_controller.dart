import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

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

  Future<void> counter() async {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) async {
        if (count <= 80) count += 1;
        if (count == 80) {
          resend = true;
          count = 0;
          // await resendOtp();
        }
      },
    );
  }

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
}
