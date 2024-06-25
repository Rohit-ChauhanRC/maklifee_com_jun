import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:maklifee_com/app/routes/app_pages.dart';
import 'package:maklifee_com/app/utils/app_colors/app_colors.dart';

import '../../../utils/widgets/profileContiner.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Obx(() => Text(
                controller.userType ?? "User",
                style: Theme.of(context).textTheme.bodyMedium,
              )),
          automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Column(children: [
          // AppBarContainer(),
          ProfileContiner(
            controller: controller,
          ),
          Container(
            color: AppColors.appColor,
            height: 30.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 5.w,
                ),
                const Text("Product Category"),
                // SizedBox(
                //   width: 100.w,
                // ),

                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.CART);
                  },
                  child: const Row(
                    children: [
                      Text("View Orders"),
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
          Obx(() => controller.p1.length > 1
              ? SizedBox(
                  // color: Colors.green,
                  height: Get.height * 0.7,
                  child: ListView.builder(
                      itemCount: controller.p1.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.ORDER,
                                arguments: controller.p1[i]["CategoryName"]
                                    .toString());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.blueDark.withOpacity(0.2),
                              border: Border.all(
                                color: AppColors.blueDark,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            margin: const EdgeInsets.only(
                                top: 5, left: 10, right: 10),
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              controller.p1[i]["CategoryName"].toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        );
                      }),
                )
              : SizedBox(
                  child: Text(
                    "No data found!",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ))
        ]),
      ),
    );
  }
}
