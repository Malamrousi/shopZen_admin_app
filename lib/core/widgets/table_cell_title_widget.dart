import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';

import '../utils/colors_manger.dart';
import '../utils/styles/app_text_styles.dart';
import '../../responsive_layout.dart';

class TableCellTitleWidget extends StatelessWidget {
  const TableCellTitleWidget(
      {super.key, required this.icon, required this.title, this.color});

  final IconData icon;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color ?? ColorsManger.whiteColor,
            size: ResponsiveLayout.isDesktop(context) ? 30 : 19.sp,
          ),
          horizontalSpacing(5),
          Text(
            title,
            style: ResponsiveLayout.isDesktop(context)
                ? AppTextStyles.font12Regular(context)
                : AppTextStyles.font16MediumFixedFontSizeWhite(context),
          )
        ],
      ),
    );
  }
}
