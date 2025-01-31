import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';
import 'package:shopzen_admin_dashboard/core/utils/font_family.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/color_extension.dart';


ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsManger.blackColor,
    extensions: const <ThemeExtension<dynamic>>[
      ColorExtension.darkColor,
    ],
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        color: ColorsManger.blackColor,
      fontFamily: FontFamily.getFontFamily(),
      ),
    ),
  );
}

ThemeData themeLight() {
  return ThemeData(
      scaffoldBackgroundColor: ColorsManger.whiteColor,
      extensions: const <ThemeExtension<dynamic>>[
        ColorExtension.lightColor,
      ],
      useMaterial3: true,
      textTheme: TextTheme(
        displaySmall: TextStyle(
          color: ColorsManger.blackColor,
        fontFamily: FontFamily.getFontFamily(),
        ),
      ),
      );
}
