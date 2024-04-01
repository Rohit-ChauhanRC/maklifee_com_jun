import 'package:get/get.dart';

class OrderController extends GetxController {
  //
  final RxString _inputUser = "Outlet".obs;
  String get inputUser => _inputUser.value;
  set inputUser(String str) => _inputUser.value = str;

  final listOfUser = ["Customer", "Franchiee", "Outlet"];

  final RxString _quantity = ''.obs;
  String get quantity => _quantity.value;
  set quantity(String mob) => _quantity.value = mob;

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
