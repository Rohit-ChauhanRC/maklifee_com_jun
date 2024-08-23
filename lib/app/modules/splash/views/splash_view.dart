import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifee_com/app/utils/app_colors/app_colors.dart';

import '../controllers/splash_controller.dart';

import 'package:lottie/lottie.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.gotologin();
    return Scaffold(
      backgroundColor: AppColors.appColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                height: 300,
                width: 300,
                child: Image.asset("assets/images/logo2.png"),
              ),
              const Spacer(),
              Lottie.asset('assets/vectors/deliveryvanwithscooter.json'),
            ],
          ),
        ),
      ),
    );
  }
}
