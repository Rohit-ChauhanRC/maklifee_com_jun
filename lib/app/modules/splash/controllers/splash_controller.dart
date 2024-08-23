import 'package:get/get.dart';
import 'package:maklifee_com/app/routes/app_pages.dart';

class SplashController extends GetxController {
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
      print('One second has passed.');
      Get.offNamed(Routes.LOGIN);
    });
  }
}
