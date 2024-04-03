import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/models/OrderDetailModel.dart';
import '../../home/controllers/home_controller.dart';
import 'package:http/http.dart' as http;

class CartDetailController extends GetxController {
  //
  final HomeController homeController = Get.find();

  final RxList<OrderDetailModel> _orderList = RxList<OrderDetailModel>();
  List<OrderDetailModel> get orderList => _orderList;
  set orderList(List<OrderDetailModel> lts) => _orderList.assignAll(lts);

  final RxString _orderId = ''.obs;
  String get orderId => _orderId.value;
  set orderId(String mob) => _orderId.value = mob;

  @override
  void onInit() async {
    super.onInit();
    orderId = Get.arguments;
    await getorder();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getorder() async {
    try {
      var res = await http.get(
        Uri.parse(
            "http://Payment.maklife.in:98/api/FranchiseeProductsInOrder?OrderId=${Get.arguments}"),
      );
      print(jsonDecode(res.body));
      if (res.statusCode == 200) {
        orderList.assignAll(orderDetailModelFromMap(res.body));
      }
    } catch (e) {
      // apiLopp(i);
    }
  }
}
