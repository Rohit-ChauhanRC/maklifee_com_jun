import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors/app_colors.dart';
import 'app_dimens/app_dimens.dart';

class Utils {
  const Utils._();
  //

  static void closeKeyboard() {
    final currentFocus = Get.focusScope;
    // if (!currentFocus.hasPrimaryFocus) {
    currentFocus!.unfocus();
    // }
  }

  static void loadingDialog() {
    Utils.closeDialog();

    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void closeDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  static void closeSnackbar() {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
  }

  static void showDialog(String message) => Get.defaultDialog(
        barrierDismissible: false,
        backgroundColor: AppColors.white,
        onWillPop: () async {
          Get.back();

          return true;
        },
        titleStyle: const TextStyle(color: AppColors.red),
        // title: success ? Strings.success : title,
        content: Text(
          message,
          textAlign: TextAlign.center,
          maxLines: 6,
          style: TextStyle(
            color: AppColors.appColor,
            fontSize: AppDimens.font16,
          ),
        ),
        confirm: Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Text(
              "OK",
              style: TextStyle(
                color: AppColors.appColor,
                fontSize: AppDimens.font16,
              ),
            ),
          ),
        ),
      );
}
