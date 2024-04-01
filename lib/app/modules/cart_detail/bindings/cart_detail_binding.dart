import 'package:get/get.dart';

import '../controllers/cart_detail_controller.dart';

class CartDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartDetailController>(
      () => CartDetailController(),
    );
  }
}
