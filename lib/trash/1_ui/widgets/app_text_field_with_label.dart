import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AppTextFieldWithLabel extends StatelessWidget {
  const AppTextFieldWithLabel({
    super.key,
    required this.controller,
    required this.textFieldType,
    required this.titleText,
    this.isReadOnly = false,
  });

  final TextEditingController controller;
  final TextFieldType textFieldType;
  final String titleText;
  final bool isReadOnly;
  @override
  Widget build(BuildContext context) {
    return AppTextField(
      readOnly: isReadOnly,
      isValidationRequired: true,
      textFieldType: textFieldType,
      controller: controller,
      cursorColor:  Theme.of(context).textTheme.bodySmall!.color!,
      textStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: isReadOnly ? Colors.grey : null),
      title: titleText,
      titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      decoration: InputDecoration(

          // labelStyle: Theme.of(context).textTheme.headlineSmall,
          alignLabelWithHint: false,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          labelText: titleText,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Theme.of(context).textTheme.bodySmall!.color!)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .color!))), // Creates an outlined border
    );
  }
}
