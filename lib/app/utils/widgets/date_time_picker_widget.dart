import 'dart:io';

import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:maklifee_com/app/utils/app_colors/app_colors.dart';
import 'package:maklifee_com/app/utils/utils.dart';

class DateTimePickerWidget extends StatelessWidget {
  final Color? iconColor;
  final void Function(DateTime?)? onSaved;
  final void Function(DateTime?)? onChanged;
  final void Function(DateTime?) onChangedIos;
  final String? hintText;
  final TextStyle? style;
  final String? Function(DateTime?)? validate;
  final DateTime? initialDate;
  DateTime? lastDate;
  DateTimePickerWidget({
    Key? key,
    this.iconColor,
    this.onChanged,
    this.hintText,
    this.style,
    this.validate,
    this.onSaved,
    this.initialDate,
    this.lastDate,
    required this.onChangedIos,
  }) : super(key: key);

  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      initialValue: initialDate,

      style: Theme.of(context).textTheme.labelMedium,
      // style: Theme.of(context).textTheme.labelMedium,
      textAlign: TextAlign.start,
      onSaved: onSaved,
      validator: validate,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        suffixIcon: Icon(
          Icons.date_range,
          color: AppColors.appColor,
        ),
      ),
      format: format,
      onChanged: onChanged,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: currentValue ?? initialDate,
          lastDate: lastDate ?? DateTime(2100),
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          // initialDatePickerMode: DatePickerMode.year,
        );
      },
    );
    // : DateTimeField(
    //     initialValue: initialDate,
    //     style: Theme.of(context).textTheme.bodySmall,
    //     textAlign: TextAlign.start,
    //     onSaved: onSaved,
    //     validator: validate,
    //     decoration: InputDecoration(
    //       fillColor: Colors.white,
    //       filled: true,
    //       hintText: hintText,
    //       suffixIcon: Icon(
    //         Icons.date_range,
    //         color: AppColors.appColor,
    //       ),
    //     ),
    //     format: format,
    //     onChanged: onChangedIos,
    //     onShowPicker: (context, currentValue) {
    //       return Utils.showIOSDatePicker(context, onChangedIos);
    //     },
    //   );
  }
}
