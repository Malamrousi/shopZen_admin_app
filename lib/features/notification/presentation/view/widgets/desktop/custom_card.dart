import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/helper/data_extension.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';
import 'package:shopzen_admin_dashboard/features/notification/presentation/view/widgets/desktop/delete_notification_bottom.dart';
import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../../core/utils/colors_manger.dart';
import '../../../../data/model/add_notification_model.dart';
import 'send_notification_bottom..dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.notifications, required this.indexId});
  final AddNotificationModel notifications;
  final int indexId;

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
              notifications.title ?? "title",
              style: AppTextStyles.font20Bold(context),
            ),
            verticalSpacing(5),
            Text(
              notifications.body ?? "body",
              style: AppTextStyles.font16RegularThemeColor(context),
            ),
            verticalSpacing(5),
            Text(
              notifications.createAt?.getFormatDateMontDayYear() ??
                  DateTime.now().getFormatDateMontDayYear(),
              style: AppTextStyles.font16RegularThemeColor(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DeleteNotificationBottom(
                  addNotificationModel: notifications,
                ),
              SendNotificationBottom(
                addNotificationModel: notifications,
                indexId: indexId,
              )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
