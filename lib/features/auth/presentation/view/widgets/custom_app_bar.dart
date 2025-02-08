import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/helper/theme_extension.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/dark_and_lang_buttons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(
        context.imageExtension.images["logo"] ?? "",
        height: 100.h,
        width: 100.w,
      ),
      Spacer(),
      DarkAndLangButtons()
      
    ],);
  }
}
