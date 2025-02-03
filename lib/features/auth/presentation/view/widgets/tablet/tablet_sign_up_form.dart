import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/core/routes/route_name.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/custom_text_rich.dart';

import '../../../../../../core/utils/styles/app_text_styles.dart';
import '../../../../../../core/widgets/app_text_form_filed.dart';
import '../../../../../../core/widgets/custom_button.dart';

class TabletSignUpForm extends StatelessWidget {
  const TabletSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             Text("name".tr(context),
              style:
                  AppTextStyles.font14RegularThemeColorFixedFontSize(context)),
          verticalSpacing(20),
          AppTextFormFiled(
            hintText: "enter_name".tr(context),
            hintStyle: AppTextStyles.font12RegularFixedFontSize(context),
            validator: (String? value) {},
          ),
            verticalSpacing(20),
          Text("email".tr(context),
              style:
                  AppTextStyles.font14RegularThemeColorFixedFontSize(context)),
          verticalSpacing(20),
          AppTextFormFiled(
            hintText: "enter_email".tr(context),
            hintStyle: AppTextStyles.font12RegularFixedFontSize(context),
            validator: (String? value) {},
          ),
          verticalSpacing(20),
          Text("password".tr(context),
              style:
                  AppTextStyles.font14RegularThemeColorFixedFontSize(context)),
          verticalSpacing(20),
          AppTextFormFiled(
            isObscureText: true,
            hintText: "enter_password".tr(context),
            validator: (String? value) {},
            hintStyle: AppTextStyles.font12RegularFixedFontSize(context),
          ),
          verticalSpacing(50),
          CustomButton(
              onPressed: () {},
              title: "login".tr(context),
              textStyle:
                  AppTextStyles.font15WhiteColorRegularFixedFontSize(context)),
          verticalSpacing(40),
          Center(
              child: CustomTextRich(
                  textAuthStyle:
                      AppTextStyles.font16MediumPrimary700FixedFontSize(
                          context),
                  tittle: "dont_have_an_account".tr(context),
                  textStyle: AppTextStyles.font14RegularThemeColorFixedFontSize(
                      context),
                  authText: "signup".tr(context),
                  routeName: RouteName.signUp)),
                  verticalSpacing(20)
        ],
      ),
    );
  }
}
