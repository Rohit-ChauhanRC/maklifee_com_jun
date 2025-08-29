import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maklifee_com/app/data/models/plant_list_model.dart';
import 'package:maklifee_com/app/routes/app_pages.dart';
import 'package:maklifee_com/app/utils/constants.dart';
import 'package:maklifee_com/app/utils/storage.dart';

import '../../../utils/utils.dart';

class LoginController extends GetxController {
  //

  final sharedPreferenceService = Get.find<Storage>();

  GlobalKey<FormState> loginFormKey = GlobalKey();

  final RxBool _circularProgress = true.obs;
  bool get circularProgress => _circularProgress.value;
  set circularProgress(bool v) => _circularProgress.value = v;

  final RxBool _check = true.obs;
  bool get check => _check.value;
  set check(bool v) => _check.value = v;

  final RxString _mobileNumber = ''.obs;
  String get mobileNumber => _mobileNumber.value;
  set mobileNumber(String mob) => _mobileNumber.value = mob;

  final RxString _inputUser = "Franchise".obs;
  String get inputUser => _inputUser.value;
  set inputUser(String str) => _inputUser.value = str;

  final listOfUser = ["Franchise", "Outlet"];

  final RxInt _selectedButton = 0.obs;
  int get selectedButton => _selectedButton.value;
  set selectedButton(int i) => _selectedButton.value = i;

  final RxList<PlantListModel?> plantList = <PlantListModel?>[].obs;

  final RxList<String> plantListString = <String>[].obs;

  final RxString _inputPlant = "".obs;
  String get inputPlant => _inputPlant.value;
  set inputPlant(String str) => _inputPlant.value = str;

  @override
  void onInit() async {
    super.onInit();
    await getPlantData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getPlantData() async {
    try {
      var res = await http.get(Uri.parse("$baseUrl/$getPlant"));

      if (res.statusCode == 200) {
        // plantList.assignAll(json.decode(res.body) as Iterable<GetPlantModel?>);
        inputPlant = plantListModelFromJson(res.body).data.first.plantName;

        for (var e in plantListModelFromJson(res.body).data) {
          plantListString.add(e.plantName.toString());
        }
        print(plantListString.first);
        // Get.offNamed(Routes.HOME, arguments: [inputUser, mobileNumber]);
      } else {
        //
        // Utils.showDialog(json.decode(res.body));
      }
    } catch (e) {
      // apiLopp(i);
    }
  }

  Future<dynamic> loginApi() async {
    Utils.closeKeyboard();
    if (!loginFormKey.currentState!.validate()) {
      return null;
    }
    if (mobileNumber == "9876543210" &&
        (inputUser == "Outlet" || inputUser == "Franchise")) {
      // await createProfile();

      // mobileNumber.substring(start)
      Get.toNamed(Routes.HOME,
          arguments: [inputUser, mobileNumber, inputPlant]);
    } else if (inputPlant.isNotEmpty) {
      await loginCred();
    } else {
      Utils.showDialog("Please select plant!");
    }
  }

  loginCred() async {
    circularProgress = false;
    try {
      var res = await http.post(
        Uri.parse("$baseUrl/$login"),
        body: {
          "MobileNo": mobileNumber.trim(),
          "LogType": "M",
          "UserType": inputUser == "Outlet" ? "O" : "F",
          "PlantName": inputPlant,
        },
      );
      final a = jsonDecode(res.body);
      print(a);
      if (res.statusCode == 200 && jsonDecode(res.body) == "OTP Sent !") {
        print(res.statusCode);
        print(res.body);

        Get.toNamed(Routes.OTP, arguments: [
          inputUser == "Outlet" ? "O" : "F",
          mobileNumber,
          inputPlant
        ]);
      } else if (res.statusCode == 200 && json.decode(res.body) == "Login") {
        await fetchUserData();
      } else {
        //
        Utils.showDialog(json.decode(res.body));
      }
      circularProgress = true;
    } catch (e) {
      // apiLopp(i);
      circularProgress = true;
    }
  }

  Future<void> fetchUserData() async {
    try {
      var res = await http.post(
        Uri.parse(
          "$baseUrl/$userData",
        ),
        body: {
          "MobileNo": mobileNumber.trim(),
          "UserType": inputUser == "Outlet" ? "O" : "F",
          "PlantName": inputPlant,
        },
      );
      if (res.statusCode == 200 &&
          json.decode(res.body) != "No Record Found ?") {
        sharedPreferenceService.setString(loginKey, inputPlant);
        sharedPreferenceService.setString(
            userTypeKey, inputUser == "Outlet" ? "O" : "F");
        sharedPreferenceService.setString(mobileNumberKey, mobileNumber.trim());

        Get.offNamed(Routes.HOME,
            arguments: [inputUser, mobileNumber, inputPlant]);
      } else {
        //
        Utils.showDialog(json.decode(res.body));
      }
    } catch (e) {
      // apiLopp(i);
    }
  }

  /*

    "OTP Sent !"

  "Login"


  "OutLet does not exists ?"

  "Franchisee does not exists ?"
  */
}
