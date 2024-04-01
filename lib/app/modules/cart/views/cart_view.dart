import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:maklifee_com/app/routes/app_pages.dart';
import 'package:maklifee_com/app/utils/widgets/custom_button.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/widgets/appBarContainer.dart';
import '../../../utils/widgets/date_time_picker_widget.dart';
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

            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  height: 40.h,
                  margin: const EdgeInsets.only(left: 20, right: 10),
                  width: Get.width * 0.45,
                  child: DateTimePickerWidget(
                    initialDate: DateTime.tryParse(controller.fromDate),
                    hintText: "From Date",
                    onChanged: (val) {
                      controller.fromDate = val!
                          .copyWith(
                              hour: 0,
                              microsecond: 0,
                              minute: 0,
                              second: 0,
                              millisecond: 0)
                          .subtract(const Duration(days: 1))
                          .toIso8601String();
                      print(val);
                    },
                  ),
                ),
                CustomButton(
                  title: "Search",
                  onPressed: () {},
                )
              ],
            ),

            Divider(
              color: AppColors.blueDark,
              thickness: 2,
              height: 20.h,
            ),
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
