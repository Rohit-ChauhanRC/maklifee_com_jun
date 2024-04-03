import 'dart:convert';

import 'package:get/get.dart';
import 'package:maklifee_com/app/modules/home/controllers/home_controller.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/getOrderModel.dart';

class CartController extends GetxController {
  //
  final HomeController homeController = Get.find();
  final RxString _fromDate = DateTime.now()
      .copyWith(hour: 0, microsecond: 0, minute: 0, second: 0, millisecond: 0)
      .toIso8601String()
      .obs;
  String get fromDate => _fromDate.value;
  set fromDate(String str) => _fromDate.value = str;

  final RxList<GetOrderModel> _orderList = RxList<GetOrderModel>();
  List<GetOrderModel> get orderList => _orderList;
  set orderList(List<GetOrderModel> lts) => _orderList.assignAll(lts);

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

  Future<void> getorder() async {
    try {
      var res = await http.get(
        Uri.parse(
            "http://Payment.maklife.in:98/api/FranchiseeorderConfirm?CustomerId=${homeController.userId}&Dated=$fromDate"),
      );
      print(jsonDecode(res.body));
      if (res.statusCode == 200) {
        orderList.assignAll(getOrderModelFromMap(res.body));
      }
    } catch (e) {
      // apiLopp(i);
    }
  }
}
