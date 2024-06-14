import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.padding,
      this.borderRadius = 8,
      required this.isFilledButton})
      : super(key: key);
  final Function() onTap;
  final String text;
  final bool isFilledButton;
  final EdgeInsets? padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      elevation: 0,
      padding: padding,
      color: isFilledButton ? Theme.of(context).primaryColor : Colors.white,
      onTap: onTap,
      shapeBorder: RoundedRectangleBorder(
          side: isFilledButton
              ? BorderSide.none
              : BorderSide(width: 1, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(borderRadius)),
      enableScaleAnimation: false,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color:
                isFilledButton ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}
