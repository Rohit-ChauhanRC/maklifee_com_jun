import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maklifee_com/app/utils/utils.dart';

import '../../../data/models/ProductDescriptionModel.dart';
import '../../../data/models/SubProductModel.dart';
import '../../../data/models/UnconfirmOrderModel.dart';
import '../../home/controllers/home_controller.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  //
  GlobalKey<FormState> orderFormKey = GlobalKey();

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

  final RxList<ProductDescriptionModel> _subProductDesc =
      RxList<ProductDescriptionModel>();
  List<ProductDescriptionModel> get subProductDesc => _subProductDesc;
  set subProductDesc(List<ProductDescriptionModel> lts) =>
      _subProductDesc.assignAll(lts);

  final Rx<ProductDescriptionModel> _subProductDescModel =
      Rx(ProductDescriptionModel());
  ProductDescriptionModel get subProductDescModel => _subProductDescModel.value;
  set subProductDescModel(ProductDescriptionModel v) =>
      _subProductDescModel.value = v;

  final RxList<UnconfirmOrderModel> _unconfirmOrderList =
      RxList<UnconfirmOrderModel>();
  List<UnconfirmOrderModel> get unconfirmOrderList => _unconfirmOrderList;
  set unconfirmOrderList(List<UnconfirmOrderModel> lts) =>
      _unconfirmOrderList.assignAll(lts);

  // final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await fetchCatId().then((value) async {
      if (id.isNotEmpty) await getProductApi(id);
    });

    await getUnconfirmOrder();
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
        subProductModel.assignAll(subProductModelFromMap(res.body));
        productModel = subProductModel[0];
      }
    } catch (e) {
      // apiLopp(i);
    }
  }

  Future<void> getProductDescApi(String id) async {
    try {
      var res = await http.get(
        Uri.parse(
            "http://Payment.maklife.in:98/api/ProductDescription?ProductCode=$id"),
      );
      if (res.statusCode == 200) {
        subProductDesc.assignAll(productDescriptionModelFromMap(res.body));
        subProductDescModel = subProductDesc[0];
      }
    } catch (e) {
      // apiLopp(i);
    }
  }

  Future<void> addItem() async {
    try {
      var res = await http.post(
        Uri.parse("http://Payment.maklife.in:98/api/FranchiseeOrder"),
        body: {
          "ProductCode": productModel.productCode,
          "Quantity": quantity,
          "CustomerId": homeController.userId
        },
      );
      print(jsonDecode(res.body));
      if (res.statusCode == 200 && jsonDecode(res.body) == "Added to Cart !") {
        Utils.showSnackbar(jsonDecode(res.body));
      } else if (res.statusCode == 200 &&
          jsonDecode(res.body) == "Product is already in cart !") {
        // await getUnconfirmOrder();
        Utils.showDialog(jsonDecode(res.body));
      } else if (jsonDecode(res.body) == "Product coul'd not added to cart ?") {
        Utils.showDialog(jsonDecode(res.body));
      }
    } catch (e) {
      // apiLopp(i);
      print(e.toString());
    }
  }

  Future<void> getUnconfirmOrder() async {
    try {
      var res = await http.get(
        Uri.parse(
            "http://Payment.maklife.in:98/api/DisplayfranchiseeOrderUnconfirm?CustomerId=${homeController.userId}"),
      );
      print(jsonDecode(res.body));
      if (res.statusCode == 200) {
        unconfirmOrderList.assignAll(unconfirmOrderModelFromMap(res.body));
      }
    } catch (e) {
      // apiLopp(i);
    }
  }

  Future<void> deleteItem(
    String id,
  ) async {
    try {
      var res = await http.post(
        Uri.parse(
            "http://Payment.maklife.in:98/api/DeleteFranchiseeOrdersProduct"),
        body: {"ProductId": id, "CustomerId": homeController.userId},
      );
      print(jsonDecode(res.body));
      if (res.statusCode == 200 &&
          jsonDecode(res.body) == "Deletion successful ") {
        Utils.showSnackbar(jsonDecode(res.body));

        //  sackbar
      }
    } catch (e) {
      // apiLopp(i);
      print(e.toString());
    }
  }

  Future<void> confirmOrder() async {
    try {
      var res = await http.post(
        Uri.parse("http://Payment.maklife.in:98/api/ConfirmFranchiseeOrder"),
        body: {"CustomerId": homeController.userId},
      );
      print(jsonDecode(res.body));
      if (res.statusCode == 200) {
        Utils.showSnackbar(jsonDecode(res.body));

        // quantity = "";

        //  sackbar
      }
    } catch (e) {
      // apiLopp(i);
      print(e.toString());
    }
  }
}
