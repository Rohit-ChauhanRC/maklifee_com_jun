import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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

  @override
  void onInit() async {
    super.onInit();
    await fetchUserData();
    userType = Get.arguments[0];
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
}
