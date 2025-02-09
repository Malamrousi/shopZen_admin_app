
import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';
import '../utils/styles/app_text_styles.dart';

class AppTextFormFiled extends StatelessWidget {
  const AppTextFormFiled(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.hintStyle,
      this.inputTextStyle,
      this.hintText,
      this.isObscureText,
      this.suffixIcon,
      this.fillColor,
      this.controller,
      required this.validator, this.onChanged, });
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? fillColor;
  final TextEditingController? controller;
  final Function(String? value) validator;
final  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      obscureText: isObscureText ?? false,
      decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? ColorsManger.gray100,
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide:
                     BorderSide(color: ColorsManger.gray300, width: 1.3),
                borderRadius: BorderRadius.circular(8),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide:  BorderSide(
                    color:ColorsManger.gray500, width: 1.3),
                borderRadius: BorderRadius.circular(8),
              ),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.3)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.3)),
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: hintStyle ?? AppTextStyles.font16Regular(context).copyWith(
              color: 
                   ColorsManger.gray500
            
          )),
      style: AppTextStyles.font16RegularThemeColor(context),
    );
  }
}