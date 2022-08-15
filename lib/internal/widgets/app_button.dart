import 'package:flutter/material.dart';
import 'package:tgs/internal/utils/style.dart';

class AppButton extends StatelessWidget {
  final double? height;
  final double? radius;
  final double? fontSize;
  final String? textButton;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final Widget? text;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  const AppButton({
    Key? key,
    this.height,
    this.radius,
    this.fontSize,
    this.borderColor,
    this.textButton,
    this.buttonColor,
    this.textColor,
    this.text,
    this.textStyle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius ?? 10),
      child: Container(
        height: height ?? 52,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? Colors.black.withOpacity(0.4),
          ),
          color: buttonColor ?? Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
        child: Center(
          child: text ?? Text(
             textButton ?? 'Button',
            style: textStyle ?? AppTextStyle.bold.copyWith(color: textColor ?? Colors.black, fontSize: fontSize ?? 16),
          ),
        ),
      ),
    );
  }
}
