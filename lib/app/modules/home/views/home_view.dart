import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:maklifee_com/app/routes/app_pages.dart';
import 'package:maklifee_com/app/utils/app_colors/app_colors.dart';

import '../../../utils/widgets/appBarContainer.dart';
import '../../../utils/widgets/profileContiner.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Franchisee",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Column(children: [
          // AppBarContainer(),
          ProfileContiner(),
          Container(
            color: AppColors.appColor,
            height: 50.h,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 30.w,
                ),
                const Text("Product Category"),
                SizedBox(
                  width: 100.w,
                ),
                IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.CART);
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors.white,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.6,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, snapshot) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.ORDER);
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
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Milk",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
