import 'dart:convert';

import 'package:get/get.dart';
import 'package:maklifee_com/app/utils/constants.dart';

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
    orderId = Get.arguments[0];
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
        Uri.parse("$baseUrl/$franchiseeProductsInOrder=${Get.arguments[0]}"),
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
