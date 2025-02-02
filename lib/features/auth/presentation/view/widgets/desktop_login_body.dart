import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/assets/assets.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';

import '../../../../../core/utils/styles/app_text_styles.dart';
import 'desktop_login_form.dart';

class DesktopLoginBody extends StatelessWidget {
  const DesktopLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "login_with_email".tr(context),
                  style: AppTextStyles.font16MediumPrimary700 (context),
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
                DesktopLoginForm()
              ],
            ),
          ),
          Expanded(flex: 2, child: SvgPicture.asset(Assets.svgShoppingDesktop))
        ],
      ),
    );
  }
}
