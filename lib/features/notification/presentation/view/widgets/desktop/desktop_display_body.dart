import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/features/notification/presentation/view/widgets/desktop/create_notification.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';

class DesktopDisplayBody extends StatelessWidget {
  const DesktopDisplayBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Notification",
                  style: AppTextStyles.font24Bold(context),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              elevation: 2, 
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ), 
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreateNotification(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}