import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/shimmer/loading_shimmer.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';

import '../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../core/utils/colors_manger.dart';

class CustomContainerPerformanceSummary extends StatelessWidget {
  const CustomContainerPerformanceSummary(
      {super.key,
      required this.title,
      required this.image,
      required this.isLoading, required this.number});
  final String title;
  final String image;
  final String number;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(
             boxShadow: [
          BoxShadow(
            color: isDark 
              ? ColorsManger.black1.withOpacity(0.4)
              : ColorsManger.primaryColor400.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: isDark 
              ? ColorsManger.black1.withOpacity(0.3)
              : ColorsManger.primaryColor400.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0.5,
          ),
        ],
          color: isDark ? ColorsManger.blackColor : ColorsManger.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title.tr(context),
                    style: AppTextStyles.font16Medium(context),
                  ),
                  Spacer(),
                  SvgPicture.asset(image)
                ],
              ),
             if(isLoading) 
             LoadingShimmer(width: 50, height: 30)
             else
             Text(number, style: AppTextStyles.font24Bold(context)),
            ],
          ),
        ),
      ),
    );
  }
}
