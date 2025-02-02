import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/helper/theme_extension.dart';
import 'package:shopzen_admin_dashboard/core/utils/font_family.dart';
import 'package:shopzen_admin_dashboard/core/utils/font_weight_manger.dart';

import '../colors_manger.dart';

class AppTextStyles {
  static TextStyle font30Bold(BuildContext context) => TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeightManger.bold,
        color: context.colorThemeExtension.mainColor,
        fontFamily: FontFamily.getFontFamily(),
      );
  static TextStyle font18Bold(BuildContext context) => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeightManger.medium,
        color: context.colorThemeExtension.mainColor,
        fontFamily: FontFamily.getFontFamily(),
      );

  static TextStyle font20BoldWhiteColor(BuildContext context) => TextStyle(
        fontSize: 20,
        fontWeight: FontWeightManger.bold,
        color: ColorsManger.whiteColor,
        fontFamily: FontFamily.getFontFamily(),
      );
  static TextStyle font16Regular(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeightManger.regular,
        color: ColorsManger.gray50,
        fontFamily: FontFamily.getFontFamily(),
      );
  static TextStyle font16RegularThemeColor(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeightManger.regular,
        color: context.colorThemeExtension.mainColor,
        fontFamily: FontFamily.getFontFamily(),
      );
  static TextStyle font20Bold(BuildContext context) => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeightManger.bold,
        color: context.colorThemeExtension.mainColor,
        fontFamily: FontFamily.getFontFamily(),
      );

  static TextStyle font16Medium(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeightManger.medium,
        color: context.colorThemeExtension.mainColor,
        fontFamily: FontFamily.getFontFamily(),
      );
  static TextStyle font16MediumPrimary700(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeightManger.medium,
        color: ColorsManger.primaryColor700,
        fontFamily: FontFamily.getFontFamily(),
      );

  static TextStyle font24Bold(BuildContext context) => TextStyle(
        fontSize: 24,
        fontWeight: FontWeightManger.bold,
        color: context.colorThemeExtension.mainColor,
        fontFamily: FontFamily.getFontFamily(),
      );

  static TextStyle font25Light(BuildContext context) => TextStyle(
        fontSize: 25,
        fontWeight: FontWeightManger.light,
        color: context.colorThemeExtension.mainColor,
        fontFamily: FontFamily.getFontFamily(),
      );

  static TextStyle font31Medium(BuildContext context) => TextStyle(
        fontSize: 31,
        fontWeight: FontWeightManger.medium,
        color: context.colorThemeExtension.mainColor,
        fontFamily: FontFamily.getFontFamily(),
      );

  static TextStyle font20WhiteColorRegular(BuildContext context) => TextStyle(
        fontSize: 20,
        fontWeight: FontWeightManger.regular,
        color: ColorsManger.whiteColor,
        fontFamily: FontFamily.getFontFamily(),
      );

  static TextStyle font25MediumPrimary700(BuildContext context) => TextStyle(
        fontSize: 25,
        fontWeight: FontWeightManger.bold,
        color: ColorsManger.primaryColor700,
        fontFamily: FontFamily.getFontFamily(),
      );
}
