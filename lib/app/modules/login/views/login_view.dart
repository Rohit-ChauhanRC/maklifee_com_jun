import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:maklifee_com/app/utils/app_colors/app_colors.dart';
import 'package:maklifee_com/app/utils/widgets/check_box_widget.dart';
import 'package:upgrader/upgrader.dart';

import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/text_form_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: UpgradeAlert(
        dialogStyle: UpgradeDialogStyle.cupertino,
        showIgnore: false,
        showLater: false,
        canDismissDialog: false,
        showReleaseNotes: true,
        upgrader: Upgrader(),
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: Image.asset(
                      "assets/images/bg.png",
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                      scale: 1,
                    ).image)),
            child: Column(
              children: [
                Container(
                  height: 80.h,
                  width: 100.w,
                  margin: EdgeInsets.only(top: 50.h),
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.fill,
                    // height: Get.height * 0.5,
                    alignment: Alignment.topCenter,
                    scale: 1,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  child: Text(
                    "Welcome",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                //
                SizedBox(
                  child: Text(
                    "MakLife E-com",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.blueDark.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.blueDark.withOpacity(0.3),
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: controller.loginFormKey,
                    child: Column(
                      children: [
                        Obx(() => SizedBox(
                              width: Get.width * 0.7,
                              child: InputDecorator(
                                decoration: const InputDecoration()
                                    .applyDefaults(
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
                          height: 30.h,
                        ),
                        Obx(() => SizedBox(
                              width: Get.width * 0.7,
                              height: 65.h,
                              child: TextFormWidget(
                                initialValue: controller.mobileNumber,
                                label: "Please enter Mobile No...",
                                onChanged: (val) =>
                                    controller.mobileNumber = val,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  signed: true,
                                ),
                                maxLength: 10,
                                validator: (val) => val!.length < 10
                                    ? "Field is required!"
                                    : null,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Obx(() => SizedBox(
                      width: Get.width * 0.75,
                      child: CheckBoxWidget(
                        title:
                            "* Terms and Condition\nI agree to terms and condition",
                        onChanged: (v) {
                          controller.check = v!;
                        },
                        value: controller.check,
                      ),
                    )),

                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  onPressed: () {
                    // Get.toNamed(Routes.OTP, arguments: ["O", "9711784343"]);
                    if (controller.check) {
                      controller.login();
                    }
                  },
                  title: "Login",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
