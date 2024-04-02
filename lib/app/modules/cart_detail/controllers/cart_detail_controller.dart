import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';

class CartDetailController extends GetxController {
  //TODO: Implement CartDetailController
  final HomeController homeController = Get.find();

  final count = 0.obs;
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

  void increment() => count.value++;
}
