import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/getproduct.dart';

class HomeController extends GetxController {
  //
  final RxBool _circularProgress = true.obs;
  bool get circularProgress => _circularProgress.value;
  set circularProgress(bool v) => _circularProgress.value = v;

  final RxString _name = ''.obs;
  String get name => _name.value;
  set name(String mob) => _name.value = mob;

  final RxString _userId = ''.obs;
  String get userId => _userId.value;
  set userId(String mob) => _userId.value = mob;

  final RxString _userType = ''.obs;
  String get userType => _userType.value;
  set userType(String str) => _userType.value = str;

  final RxList<GetProductModel> _products = RxList<GetProductModel>();
  List<GetProductModel> get products => _products;
  set products(List<GetProductModel> lt) => _products.assignAll(lt);

  final RxList _p1 = [].obs;
  List get p1 => _p1;
  set p1(List ls) => _p1.assignAll(ls);

  @override
  void onInit() async {
    super.onInit();
    await fetchUserData();
    userType = Get.arguments[0];
    await getProductApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchUserData() async {
    try {
      print("object");
      var res = await http.post(
        Uri.parse(
          "http://Payment.maklife.in:98/api/CustomerId",
        ),
        body: {
          "MobileNo": Get.arguments[1].trim(),
          "UserType": Get.arguments[0] == "Outlet" ? "O" : "F"
        },
      );
      if (res.statusCode == 200) {
        print(Get.arguments[1].trim());
        print(Get.arguments[0].trim());
        print(res.statusCode);
        print(res.body);
        userId = res.body.substring(1, 9);
        name = res.body.substring(9);
        userType = Get.arguments[0];
      }
      circularProgress = true;
    } catch (e) {
      // apiLopp(i);
      circularProgress = true;
    }
  }

  Future<void> getProductApi() async {
    try {
      var res = await http.get(
        Uri.parse("http://Payment.maklife.in:98/api/CategoryBhatinda"),
      );
      if (res.statusCode == 200) {
        print(res.statusCode);
        if (res.statusCode == 200) {
          // final v = jsonDecode(res.body);
          // v.map((e) => GetProductModel.fromJson(e)).toList();
          print("${jsonDecode(res.body).length}");
          p1.assignAll(jsonDecode(res.body));
          print(p1);
          products.assignAll(jsonDecode(res.body)
              .map((e) => GetProductModel.fromJson(e))
              .toList());
          print("products.length: ${products.length}");
        }
      }
    } catch (e) {
      // apiLopp(i);
    }
  }
}
