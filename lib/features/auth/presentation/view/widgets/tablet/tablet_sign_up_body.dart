import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/user_avatar_image.dart';

import 'tablet_sign_up_form.dart';

class TabletSignUpBody extends StatelessWidget {
  const TabletSignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
         Text(
            "sign_up_with_email".tr(context),
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
          Center(
            child: UserAvatarImage(),
          ),
          TabletSignUpForm()
      ],
    );
  }
}