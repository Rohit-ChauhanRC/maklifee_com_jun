import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maklifee_com/app/utils/app_colors/app_colors.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.text,
    required this.index,
    required this.selectedButton,
    required this.press,
  });

  final String text;
  final int index;
  final int selectedButton;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press(index);
      },
      child: RadioListTile(
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
          softWrap: true,
        ),
        groupValue: selectedButton,
        value: index,
        activeColor: AppColors.green,
        onChanged: (val) async {
          press(index);
        },
        toggleable: true,
        // fillColor: WidgetStateProperty.all(Colors.transparent),
      ),
    );
  }
}
