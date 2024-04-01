import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:maklifee_com/app/routes/app_pages.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/widgets/appBarContainer.dart';
import '../../../utils/widgets/profileContiner.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Franchisee",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const AppBarContainer(),
            const ProfileContiner(),
            SizedBox(
              height: Get.height * 0.65,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, i) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.CART_DETAIL);
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
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "F00003509",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
