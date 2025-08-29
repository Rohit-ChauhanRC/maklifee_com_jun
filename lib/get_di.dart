import 'package:get/get.dart';
import 'package:maklifee_com/app/utils/storage.dart';

init() async {
  final sharedPreferenceService = Storage();
  await sharedPreferenceService.init();
  Get.put(sharedPreferenceService);
}
