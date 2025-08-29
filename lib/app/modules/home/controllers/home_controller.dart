import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:maklifee_com/app/utils/constants.dart';
import 'package:maklifee_com/app/utils/storage.dart';

import '../../../data/models/getproduct.dart';

class HomeController extends GetxController {
  //

  final sharedPreferenceService = Get.find<Storage>();

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

  final RxString _inputPlant = "".obs;
  String get inputPlant => _inputPlant.value;
  set inputPlant(String str) => _inputPlant.value = str;

  //  sharedPreferenceService.getString(userTypeKey),
  //         sharedPreferenceService.getString(mobileNumberKey),
  //         sharedPreferenceService.getString(loginKey)

  @override
  void onInit() async {
    super.onInit();
    userType =
        Get.arguments[0] ?? sharedPreferenceService.getString(userTypeKey);
    inputPlant =
        Get.arguments[2] ?? sharedPreferenceService.getString(loginKey);
    await fetchUserData();

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
          "$baseUrl/$userData",
        ),
        body: {
          "MobileNo": Get.arguments[1].trim() ??
              sharedPreferenceService.getString(mobileNumberKey),
          "UserType": userType == "Outlet"
              ? "O"
              : userType == "Franchise"
                  ? "F"
                  : userType == "O"
                      ? "O"
                      : "F",
          "PlantName": inputPlant,
        },
      );
      if (res.statusCode == 200) {
        print("res.body: ${res.body}");

        userId = res.body.substring(1, 9);
        name = res.body.substring(9);
        userType = userType == "Outlet"
            ? "O"
            : userType == "Franchise"
                ? "F"
                : userType == "O"
                    ? "O"
                    : "F";
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
        Uri.parse("$baseUrl/$categoryBhatinda?PlantName=${Get.arguments[2]}"),
      );
      if (res.statusCode == 200) {
        if (res.statusCode == 200) {
          // final v = jsonDecode(res.body);
          // v.map((e) => GetProductModel.fromJson(e)).toList();

          p1.assignAll(jsonDecode(res.body));
          products.assignAll(getProductModelFromMap(res.body));
        }
      }
    } catch (e) {
      // apiLopp(i);
    }
  }
}
