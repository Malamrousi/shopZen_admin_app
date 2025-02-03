import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/routes/route_name.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';
import 'package:shopzen_admin_dashboard/core/widgets/app_text_form_filed.dart';
import 'package:shopzen_admin_dashboard/core/widgets/custom_button.dart';

import '../../../../../../core/helper/spacing.dart';
import '../custom_text_rich.dart';

class MobileSignUpForm extends StatelessWidget {
  const MobileSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
           Text("name".tr(context),
            style: AppTextStyles.font14RegularThemeColorFixedFontSize(context)),
        verticalSpacing(5.h),
        AppTextFormFiled(
          hintText: "enter_name".tr(context),
          hintStyle: AppTextStyles.font12RegularFixedFontSize(context),
          validator: (String? value) {},
        ),
        verticalSpacing(10.h),
       Text("email".tr(context),
            style: AppTextStyles.font14RegularThemeColorFixedFontSize(context)),
        verticalSpacing(5.h),
        AppTextFormFiled(
          hintText: "enter_email".tr(context),
          hintStyle: AppTextStyles.font12RegularFixedFontSize(context),
          validator: (String? value) {},
        ),
        verticalSpacing(10.h),
        Text("password".tr(context),
            style: AppTextStyles.font14RegularThemeColorFixedFontSize(context)),
        verticalSpacing(5.h),
        AppTextFormFiled(
          isObscureText: true,
          hintText: "enter_password".tr(context),
          validator: (String? value) {},
          hintStyle: AppTextStyles.font12RegularFixedFontSize(context),
        ),
        verticalSpacing(40.h),
        CustomButton(
            onPressed: () {},
            title: "signup".tr(context),
            textStyle:
                AppTextStyles.font15WhiteColorRegularFixedFontSize(context)),
        verticalSpacing(40),
        Center(
            child: CustomTextRich(
                textAuthStyle:
                    AppTextStyles.font16MediumPrimary700FixedFontSize(context),
                tittle: "dont_have_an_account".tr(context),
                textStyle:
                    AppTextStyles.font14RegularThemeColorFixedFontSize(context),
                authText: "signup".tr(context),
                routeName: RouteName.login))
      ],
    ));
    
  }
}