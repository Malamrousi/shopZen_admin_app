import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_pref.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/view/widgets/desktop/performance_summary.dart';

import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/shared_pref/shared_prefs_key.dart';

class CustomDashboardWidget extends StatelessWidget {
  const CustomDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;

    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: isDark ? ColorsManger.backgroundColor : ColorsManger.whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "dashboard".tr(context),
                style: AppTextStyles.font24Bold(context),
              ),
              verticalSpacing(20),
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: PerformanceSummary()),
            ],
          ),
        ),
      ),
    );
  }
}
