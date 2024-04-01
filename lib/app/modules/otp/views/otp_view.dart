import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/text_form_widget.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
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
                  "OTP Verify",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              //
              SizedBox(
                width: Get.width * 0.5,
                child: Text(
                  "Otp Send on this 9876543210, resend otp after 80s",
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
                            height: 65.h,
                            child: TextFormWidget(
                              initialValue: controller.mobileNumber,
                              label: "Please enter OTP...",
                              onChanged: (val) => controller.mobileNumber = val,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                signed: true,
                              ),
                              maxLength: 4,
                              validator: (val) =>
                                  val!.length < 4 ? "Field is required!" : null,
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

              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                onPressed: () {
                  Get.toNamed(Routes.HOME);
                },
                title: "Verify",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
