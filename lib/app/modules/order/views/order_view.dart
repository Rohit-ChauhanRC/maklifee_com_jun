import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../data/models/SubProductModel.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/utils.dart';
import '../../../utils/widgets/appBarContainer.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/profileContiner.dart';
import '../../../utils/widgets/text_form_widget.dart';
import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);
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
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: 0.5,
                  alignment: Alignment.bottomRight,
                  fit: BoxFit.fill,
                  image: Image.asset(
                    "assets/images/bg1.png",
                    fit: BoxFit.fill,

                    alignment: Alignment.bottomRight,
                    scale: 1,
                    // isAntiAlias: true,
                  ).image)),
          child: Column(
            children: [
              // const AppBarContainer(),
              ProfileContiner(
                controller: controller.homeController,
              ),
              Form(
                key: controller.orderFormKey,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.blueDark.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.blueDark.withOpacity(0.3),
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Select your product",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(() => controller.subProductModel.isNotEmpty
                          ? SizedBox(
                              // width: Get.width * 0.8,
                              child: InputDecorator(
                                decoration: const InputDecoration()
                                    .applyDefaults(
                                        Theme.of(context).inputDecorationTheme),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton<SubProductModel>(
                                  iconEnabledColor: AppColors.blueDark,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                  isExpanded: true,
                                  items: controller.subProductModel.map(
                                      (SubProductModel dropDownStringItem) {
                                    return DropdownMenuItem<SubProductModel>(
                                      value: dropDownStringItem,
                                      child: SizedBox(
                                        width: Get.width * 0.7,
                                        child: Text(
                                          dropDownStringItem.product.toString(),
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (SubProductModel? val) async {
                                    controller.productModel = val!;
                                    await controller.getProductDescApi(
                                        val.productCode.toString());
                                  },
                                  value: controller.productModel,
                                  isDense: true,
                                )),
                              ),
                            )
                          : const SizedBox()),
                      SizedBox(
                        height: 5.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter product quantity",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(() => SizedBox(
                            // width: Get.width * 0.7,
                            height: 60.h,
                            child: TextFormWidget(
                              initialValue: controller.quantity,
                              label: "Please enter Quantity...",
                              onChanged: (val) => controller.quantity = val,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                signed: true,
                              ),
                              maxLength: 3,
                              // validator: (val) => val!.length < 10
                              //     ? "Field is required!"
                              //     : null,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          )),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Product Description",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(() => Container(
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
                                controller.subProductDescModel.descriptionMaster
                                        .toString() ??
                                    "",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(() => controller.subProductModel.isNotEmpty
                          ? SizedBox(
                              width: Get.width * 0.4,
                              child: CustomButton(
                                onPressed: () async {
                                  if (controller.quantity.isNotEmpty &&
                                      int.tryParse(controller.quantity) != 0) {
                                    await controller
                                        .addItem()
                                        .then((value) async {
                                      await controller.getUnconfirmOrder();
                                    });
                                  } else {
                                    Utils.showDialog(
                                        "Please check first quantity either empty or zero!");
                                  }
                                },
                                title: "Add Item",
                              ),
                            )
                          : const SizedBox()),
                    ],
                  ),
                ),
              ),
              Obx(() => controller.unconfirmOrderList.isNotEmpty
                  ? Container(
                      // color: Colors.amber,
                      height: Get.height * 0.3,
                      child: ListView.builder(
                          itemCount: controller.unconfirmOrderList.length,
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
                              margin: const EdgeInsets.only(
                                  top: 5, left: 10, right: 10),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          "Product:",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.450,
                                        child: Text(
                                          controller
                                                  .unconfirmOrderList[i].name ??
                                              "",
                                          overflow: TextOverflow.visible,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          "Quantity:",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "${double.tryParse(controller.unconfirmOrderList[i].qantity)!.toDouble().ceil()}" ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          "MRP:",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "₹${controller.unconfirmOrderList[i].mrp}" ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      // const SizedBox(
                                      //   width: 50,
                                      // ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: InkWell(
                                              onTap: () async {
                                                await controller
                                                    .deleteItem(controller
                                                        .unconfirmOrderList[i]
                                                        .productId)
                                                    .then((value) async {
                                                  await controller
                                                      .getUnconfirmOrder();
                                                });
                                              },
                                              child: const Icon(
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
                    )
                  : SizedBox(
                      height: Get.height * 0.3,
                    )),

              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      // width: Get.width * 0.4,
                      child: CustomButton(
                        onPressed: () async {
                          await controller.confirmOrder().then((value) async {
                            await controller.getUnconfirmOrder();
                          });
                          // Get.toNamed(Routes.OTP);
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
                          Get.toNamed(Routes.CART);
                        },
                        title: "View Orders",
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
