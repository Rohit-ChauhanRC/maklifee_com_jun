import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/widgets/profileContiner.dart';
import '../controllers/cart_detail_controller.dart';

class CartDetailView extends GetView<CartDetailController> {
  const CartDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
              controller.homeController.userType ?? "User",
              style: Theme.of(context).textTheme.bodyMedium,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileContiner(
              controller: controller.homeController,
            ),
            Container(
              color: AppColors.appColor,
              height: 30.h,
              width: Get.width,
              padding: const EdgeInsets.only(left: 50, top: 5),
              child: const Text("Your Ordered Products"),
            ),
            Obx(() => Container(
                  margin: const EdgeInsets.only(top: 20),
                  color: AppColors.appColor,
                  height: 30.h,
                  width: Get.width,
                  padding: const EdgeInsets.only(left: 50, top: 5),
                  child: Text("Order Id - ${controller.orderId}"),
                )),
            Obx(() => SizedBox(
                  height: Get.height * 0.47,
                  child: ListView.builder(
                      itemCount: controller.orderList.length,
                      itemBuilder: (_, i) {
                        return Container(
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
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      "Product:",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    controller.orderList[i].name ?? "",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      "Quantity:",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    controller.orderList[i].quantity ?? "",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      "MRP:",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    controller.orderList[i].mrp ?? "",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      "Date:",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    controller.orderList[i].date ?? "",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                )),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  color: AppColors.blueDark.withOpacity(0.5),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Text(
                "Your order has been confirmed and delivery will be soon!!",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
