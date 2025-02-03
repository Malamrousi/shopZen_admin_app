import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/mobile/mobile_sign_up_form.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/user_avatar_image.dart';

import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';

class MobileSignUpBody extends StatelessWidget {
  const MobileSignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("sign_up_with_email".tr(context),
            style: AppTextStyles.font18BoldPrimary700FixedFontSize(context)),
        verticalSpacing(20.h),
        Text("welcome_to_shop_zen_admin".tr(context),
            style: AppTextStyles.font19RegularThemeColorFixedFontSize(context)),
        verticalSpacing(20.h),
        Text("Effortlessly_manage_your_store".tr(context),
            style: AppTextStyles.font16LightFixedFontSize(context)),
        verticalSpacing(20.h),
        Center(child: UserAvatarImage()),
        MobileSignUpForm()
      ],
    );
  }
}