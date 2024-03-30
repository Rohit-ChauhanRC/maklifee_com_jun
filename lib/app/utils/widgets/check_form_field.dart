import 'package:flutter/material.dart';
import 'package:maklifee_com/app/utils/app_colors/app_colors.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    super.key,
    required Widget title,
    FormFieldSetter<bool>? onSaved,
    FormFieldValidator<bool>? validator,
    TextStyle? style,
    bool initialValue = false,
    ListTileControlAffinity? trailing,
  }) : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<bool> state) {
              return CheckboxListTile(
                activeColor: AppColors.green,
                dense: state.hasError,
                title: title,
                value: state.value,
                onChanged: state.didChange,
                subtitle: state.hasError
                    ? Text(
                        "Error!",
                        style: style,
                      )
                    : null,
                controlAffinity: trailing ?? ListTileControlAffinity.leading,
              );
            });
}
