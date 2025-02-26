import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';
import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../../core/utils/colors_manger.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;

    return Card(
      color: isDark ? ColorsManger.blackColor : ColorsManger.cloudGray,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title: wiweiliweiw",
              style: AppTextStyles.font20Bold(context),
            ),
            verticalSpacing(5),
            Text(
              "Body: body lasdlasldlas",
              style: AppTextStyles.font16RegularThemeColor(context),
            ),
            verticalSpacing(5),
            Text(
              "Create At: 17-2-2024",
              style: AppTextStyles.font16RegularThemeColor(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.yellow),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.green),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}