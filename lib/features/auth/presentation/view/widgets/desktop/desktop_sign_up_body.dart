import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/assets/assets.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/desktop/desktop_sign_up_form.dart';

import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';

class DesktopSignUpBody extends StatelessWidget {
  const DesktopSignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "sign_up_with_email".tr(context),
                style: AppTextStyles.font25MediumPrimary700(context),
              ),
              verticalSpacing(20),
             Text(
                  "welcome_to_shop_zen_admin".tr(context),
                  style: AppTextStyles.font24Bold(context),
                ),
                verticalSpacing(20),
                Text(
                  "Effortlessly_manage_your_store".tr(context),
                  style: AppTextStyles.font25Light(context),
                ),
                verticalSpacing(20),
                DesktopSignUpForm()
            ],
          ),
        ),
        Expanded(flex: 2, child: SvgPicture.asset(Assets.svgShoppingDesktop))
      ],
    );
  }
}
