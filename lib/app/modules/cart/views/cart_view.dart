import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:maklifee_com/app/routes/app_pages.dart';
import 'package:maklifee_com/app/utils/widgets/custom_button.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/widgets/date_time_picker_widget.dart';
import '../../../utils/widgets/profileContiner.dart';
import '../controllers/cart_controller.dart';
import 'package:intl/intl.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text(
                controller.homeController.userType ?? "User",
                style: Theme.of(context).textTheme.bodyMedium,
              ))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const AppBarContainer(),
            ProfileContiner(
              controller: controller.homeController,
            ),

            Row(
              children: [
                Obx(() => Container(
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.only(left: 20, right: 10),
                      width: Get.width * 0.45,
                      height: 40.h,
                      child: DateTimePickerWidget(
                        initialDate: DateTime.tryParse(controller.fromDate),
                        hintText: "From Date",
                        onChanged: (val) {
                          controller.fromDate =
                              DateFormat("yyyy-MM-dd").format(val!).toString();
                        },
                        onChangedIos: (val) {
                          print("val: $val");
                          controller.fromDate =
                              DateFormat("yyyy-MM-dd").format(val!).toString();
                        },
                        lastDate: DateTime.now(),
                      ),
                    )),
                CustomButton(
                  title: "Search",
                  onPressed: () {
                    print(controller.fromDate);
                    if (controller.fromDate.isNotEmpty) controller.getorder();
                  },
                )
              ],
            ),

            Divider(
              color: AppColors.blueDark,
              thickness: 2,
              height: 20.h,
            ),
            Obx(() => SizedBox(
                  height: Get.height * 0.65,
                  child: ListView.builder(
                      itemCount: controller.orderList.length,
                      itemBuilder: (_, i) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.CART_DETAIL,
                                arguments: controller.orderList[i].orderId);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(
                                color: AppColors.blueDark.withOpacity(0.5),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    "Ordere ID:",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  controller.orderList[i].orderId ?? "",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )),
          ],
        ),
      ),
    );
  }
}
