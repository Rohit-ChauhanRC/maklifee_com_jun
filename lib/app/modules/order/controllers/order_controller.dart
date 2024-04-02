import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/models/SubProductModel.dart';
import '../../home/controllers/home_controller.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  //

  final HomeController homeController = Get.find();

  final RxString _inputUser = "Outlet".obs;
  String get inputUser => _inputUser.value;
  set inputUser(String str) => _inputUser.value = str;

  final listOfUser = ["Franchiee", "Outlet"];

  final RxString _quantity = ''.obs;
  String get quantity => _quantity.value;
  set quantity(String mob) => _quantity.value = mob;

  final RxString _id = ''.obs;
  String get id => _id.value;
  set id(String mob) => _id.value = mob;

  final RxList _p1 = [].obs;
  List get p1 => _p1;
  set p1(List ls) => _p1.assignAll(ls);

  final RxList<SubProductModel> _subProductModel = RxList<SubProductModel>();
  List<SubProductModel> get subProductModel => _subProductModel;
  set subProductModel(List<SubProductModel> lts) =>
      _subProductModel.assignAll(lts);

  final Rx<SubProductModel> _productModel = Rx(SubProductModel());
  SubProductModel get productModel => _productModel.value;
  set productModel(SubProductModel v) => _productModel.value = v;

  // final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await fetchCatId().then((value) async {
      if (id.isNotEmpty) await getProductApi(id);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void increment() => count.value++;

  Future<void> fetchCatId() async {
    try {
      var res = await http.post(
        Uri.parse(
          "http://Payment.maklife.in:98/api/CategoryId",
        ),
        body: {"Catname": Get.arguments},
      );
      if (res.statusCode == 200) {
        // print(res.body);
        id = jsonDecode(res.body).toString();
        // await getProductApi(res.body);
      }
      // circularProgress = true;
    } catch (e) {
      // apiLopp(i);
      // circularProgress = true;
    }
  }

  Future<void> getProductApi(String id) async {
    try {
      var res = await http.get(
        Uri.parse("http://Payment.maklife.in:98/api/ProductBh?CatId=$id"),
      );
      if (res.statusCode == 200) {
        // print(jsonDecode(res.body));
        p1.assignAll(jsonDecode(res.body));
        subProductModel.assignAll(subProductModelFromMap(res.body));
        print(subProductModel);
        productModel = subProductModel[0];
        // print(p1);
      }
    } catch (e) {
      // apiLopp(i);
    }
  }
}
