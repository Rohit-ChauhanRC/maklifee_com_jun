import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maklifee_com/app/modules/home/controllers/home_controller.dart';

import '../app_colors/app_colors.dart';

class ProfileContiner extends StatelessWidget {
  const ProfileContiner({
    super.key,
    required this.controller,
  });
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.blueDark.withOpacity(0.5),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 50.w,
                child: Text(
                  "Name:",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Obx(() => Text(
                    controller.name.replaceAll('"', "") ?? "Test",
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 50.w,
                child: Text(
                  "ID:",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Obx(() => Text(
                    controller.userId ?? "00",
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
