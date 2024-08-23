import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    this.onChanged,
    this.label,
    this.keyboardType,
    this.readOnly = false,
    this.initialValue,
    this.validator,
    this.textController,
    this.suffix = false,
    this.maxLength,
    this.inputFormatters,
  });

  final void Function(String)? onChanged;
  final String? label;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool suffix;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? textController;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        // expands: true,
        // key: UniqueKey(),
        // maxLength: maxLength,
        // maxLines: null,
        // minLines: null,
        validator: validator,
        initialValue: initialValue,
        autovalidateMode: AutovalidateMode.always,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.bodySmall,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
                hintText: label, contentPadding: const EdgeInsets.all(10)
                // label: Text(label!),
                )
            .applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }
}
