import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/core/routes/route_name.dart';
import 'package:shopzen_admin_dashboard/core/widgets/app_text_form_filed.dart';
import 'package:shopzen_admin_dashboard/core/widgets/custom_button.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/custom_text_rich.dart';

import '../../../../../core/utils/styles/app_text_styles.dart';

class DesktopLoginForm extends StatelessWidget {
  const DesktopLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("email".tr(context),
            style: AppTextStyles.font16RegularThemeColor(context)),
        verticalSpacing(10),
        AppTextFormFiled(
          hintText: "enter_email".tr(context),
          validator: (String? value) {},
        ),
        verticalSpacing(20),
        Text("password".tr(context),
            style: AppTextStyles.font16RegularThemeColor(context)),
            verticalSpacing(10),
        AppTextFormFiled(
          isObscureText: true,
          hintText: "enter_password".tr(context),
          validator: (String? value) {},
        ),
        verticalSpacing(50),
        CustomButton(onPressed: () {}, title: "login".tr(context)),
          verticalSpacing(20),
        CustomTextRich(tittle: "dont_have_an_account".tr(context), authText: "signup".tr(context), routeName: RouteName.signUp)
      ],
    ));
  }
}
