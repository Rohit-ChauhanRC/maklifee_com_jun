import 'package:flutter/material.dart';
import 'package:maklifee_com/app/utils/app_colors/app_colors.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appColor,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: Text(
        "Franchisee",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
