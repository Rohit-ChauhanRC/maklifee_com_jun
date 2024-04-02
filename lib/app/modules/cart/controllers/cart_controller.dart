import 'package:get/get.dart';
import 'package:maklifee_com/app/modules/home/controllers/home_controller.dart';

class CartController extends GetxController {
  //
  final HomeController homeController = Get.find();
  final RxString _fromDate = DateTime.now()
      .copyWith(hour: 0, microsecond: 0, minute: 0, second: 0, millisecond: 0)
      .toIso8601String()
      .obs;
  String get fromDate => _fromDate.value;
  set fromDate(String str) => _fromDate.value = str;

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
