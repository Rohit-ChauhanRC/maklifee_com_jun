import 'package:get/get.dart';
import 'package:maklifee_com/app/routes/app_pages.dart';
import 'package:maklifee_com/app/utils/constants.dart';
import 'package:maklifee_com/app/utils/storage.dart';

class SplashController extends GetxController {
  //
  final sharedPreferenceService = Get.find<Storage>();

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

  gotologin() {
    Future.delayed(
        const Duration(
          seconds: 6,
        ), () {
      // print('One second has passed.');
      if (sharedPreferenceService.getString(userTypeKey) != null &&
          sharedPreferenceService.getString(userTypeKey)!.isNotEmpty) {
        Get.offAllNamed(Routes.HOME, arguments: [
          sharedPreferenceService.getString(userTypeKey),
          sharedPreferenceService.getString(mobileNumberKey),
          sharedPreferenceService.getString(loginKey)
        ]);
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    });
  }
}
