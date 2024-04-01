import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/widgets/appBarContainer.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/profileContiner.dart';
import '../../../utils/widgets/text_form_widget.dart';
import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: 0.5,
                    alignment: Alignment.bottomRight,
                    image: Image.asset(
                      "assets/images/bg1.png",
                      // fit: BoxFit.fill,
                      alignment: Alignment.bottomRight,
                      scale: 1,
                      // isAntiAlias: true,
                    ).image)),
            child: Column(
              children: [
                const AppBarContainer(),
                const ProfileContiner(),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.blueDark.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.blueDark.withOpacity(0.3),
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Select your product",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() => SizedBox(
                            // width: Get.width * 0.8,
                            child: InputDecorator(
                              decoration: const InputDecoration().applyDefaults(
                                  Theme.of(context).inputDecorationTheme),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                iconEnabledColor: AppColors.blueDark,
                                style: Theme.of(context).textTheme.bodySmall,
                                isExpanded: true,
                                items: controller.listOfUser
                                    .map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: SizedBox(
                                      width: Get.width * 0.6,
                                      child: Text(
                                        dropDownStringItem.toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? val) {
                                  controller.inputUser = val!;
                                },
                                value: controller.inputUser,
                                isDense: true,
                              )),
                            ),
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      Obx(() => SizedBox(
                            // width: Get.width * 0.8,
                            height: 35.h,
                            child: TextFormWidget(
                              initialValue: controller.quantity,
                              label: "Please enter Quntity...",
                              onChanged: (val) => controller.quantity = val,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                signed: true,
                              ),
                              validator: (val) =>
                                  val!.isNotEmpty && int.tryParse(val)! < 1
                                      ? "Field is required!"
                                      : null,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Product Description",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(
                            color: AppColors.blueDark.withOpacity(0.5),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: Get.width,
                        // margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          width: 50.w,
                          child: Text(
                            "Name",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.4,
                            child: CustomButton(
                              onPressed: () {
                                Get.toNamed(Routes.OTP);
                              },
                              title: "Add Item",
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          SizedBox(
                            width: Get.width * 0.4,
                            child: CustomButton(
                              onPressed: () {
                                Get.toNamed(Routes.OTP);
                              },
                              title: "Go Back",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.2,
                  child: ListView.builder(
                      itemCount: 10,
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
                                    "Pulkit",
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
                                    "10001",
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
                                    "66",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  // const SizedBox(
                                  //   width: 50,
                                  // ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.delete_forever,
                                            color: AppColors.red,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      // width: Get.width * 0.4,
                      child: CustomButton(
                        onPressed: () {
                          Get.toNamed(Routes.OTP);
                        },
                        title: "Confirm Order",
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      // width: Get.width * 0.4,
                      child: CustomButton(
                        onPressed: () {
                          Get.toNamed(Routes.OTP);
                        },
                        title: "View Orders",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
