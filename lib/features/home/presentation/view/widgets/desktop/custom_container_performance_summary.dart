import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';

class CustomContainerPerformanceSummary extends StatelessWidget {
  const CustomContainerPerformanceSummary({super.key, required this.title, required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
            Text("200", style: AppTextStyles.font24Bold(context)),
          ],
          
        ),
      ),
    );
  }
}
