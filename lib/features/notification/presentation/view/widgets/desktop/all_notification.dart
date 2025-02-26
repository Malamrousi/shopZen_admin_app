import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';

import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';
import 'custom_card.dart';

class AllNotification extends StatelessWidget {
  const AllNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacing(20),
        Text(
          "all_notification".tr(context),
          style: AppTextStyles.font25MediumPrimary700(context),
        ),
          verticalSpacing(20),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2,
          ),
          itemCount: 11,
          itemBuilder: (context, index) {
            return const CustomCard();
          },
        ),
                verticalSpacing(20),

      ],
    );
  }
}