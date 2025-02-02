import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/tablet_login_form.dart';

import '../../../../../core/utils/styles/app_text_styles.dart';

class TabletLoginBody extends StatelessWidget {
  const TabletLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "login_with_email".tr(context),
            style: AppTextStyles.font16MediumPrimary700FixedFontSize(context),
          ),
          verticalSpacing(20),
          Text(
            "welcome_to_shop_zen_admin".tr(context),
            style: AppTextStyles.font16BoldFixedFontSize(context),
          ),
          verticalSpacing(20),
          Text(
            "Effortlessly_manage_your_store".tr(context),
            style: AppTextStyles.font16LightFixedFontSize(context),
          ),
          verticalSpacing(20),
          TabletLoginForm()
        ],
      ),
    );
  }
}
