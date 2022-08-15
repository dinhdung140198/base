import 'package:flutter/material.dart';
import 'package:tgs/internal/utils/style.dart';

class AppInputTextField extends StatelessWidget {
  AppInputTextField({
    Key? key,
    this.height,
    this.controller,
    this.focusNode,
    this.label,
    this.labelText,
    this.obscureText,
    this.textInputAction,
    this.keyboardType,
    this.onChanged,
    this.onSummited,
  })  : inputDecoration = InputDecoration(
          border: InputBorder.none,
          hintStyle: AppTextStyle.normal.copyWith(
            fontSize: 16,
            color: Colors.grey,
          ),
          label: label ??
              Text(
                '',
                style: AppTextStyle.normal,
              ),
          labelStyle: AppTextStyle.normal,
          labelText: labelText,
        ),
        super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final double? height;
  final Widget? label;
  final String? labelText;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final InputDecoration inputDecoration;
  final Function(String)? onChanged;
  final Function(String)? onSummited;


  AppInputTextField.email({
    Key? key,
    this.controller,
    this.focusNode,
    this.height,
    this.label,
    this.labelText = 'Email',
    this.obscureText = false,
    this.onChanged,
    this.onSummited,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.emailAddress,
  })  : inputDecoration = InputDecoration(
          border: InputBorder.none,
          hintStyle: AppTextStyle.normal.copyWith(
            fontSize: 16,
            color: Colors.grey,
          ),
          labelStyle: AppTextStyle.normal,
          labelText: labelText,
        ),
        super(key: key);

  AppInputTextField.password({
    Key? key,
    this.controller,
    this.focusNode,
    this.height,
    this.label,
    this.labelText = 'Password',
    this.obscureText = true,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onSummited,
    Widget? suffixIcon,
  })  : inputDecoration = InputDecoration(
          border: InputBorder.none,
          hintStyle: AppTextStyle.normal.copyWith(
            fontSize: 16,
            color: Colors.grey,
          ),
          labelStyle: AppTextStyle.normal,
          labelText: labelText,
          suffixIcon: suffixIcon,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 52,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black.withOpacity(0.4),),
      ),
      padding: const EdgeInsets.only(left: 15, right: 15,),
      child: TextField(
        //cursorHeight: 6.0,
        controller: controller,
        focusNode: focusNode,
        decoration: inputDecoration,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        style: AppTextStyle.normal,
        onChanged: onChanged,
        onSubmitted: onSummited,
      ),
    );
  }
}
