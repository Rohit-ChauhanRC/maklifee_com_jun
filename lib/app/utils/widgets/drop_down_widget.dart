import 'package:flutter/material.dart';

class DropdownFormField<T> extends FormField<T> {
  DropdownFormField({
    super.key,
    required T initialValue,
    required List<DropdownMenuItem<T>> items,
    required FormFieldSetter<T> onSaved,
    FormFieldSetter<T>? onChanged,
    FormFieldValidator<T>? validator,
    String? hintDrop,
    InputDecoration? decoration,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: items.contains(initialValue) ? initialValue : null,
          builder: (FormFieldState<T> field) {
            return DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                value: field.value,
                isDense: true,
                onChanged: field.didChange,
                items: items.toList(),
              ),
            );
          },
        );
}
