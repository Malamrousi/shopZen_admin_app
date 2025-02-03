import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/core/routes/route_name.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';
import 'package:shopzen_admin_dashboard/core/widgets/app_text_form_filed.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/custom_text_rich.dart';

import '../../../../../../core/widgets/custom_button.dart';

class DesktopSignUpForm extends StatelessWidget {
  const DesktopSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthBloc>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
      children: [
          Text("name".tr(context),
            style: AppTextStyles.font16RegularThemeColor(context)),
        verticalSpacing(10),
        AppTextFormFiled(
          hintText: "enter_name".tr(context),
          validator: (String? value) {},
        ),
                verticalSpacing(20),
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
        CustomButton(onPressed: () {}, title: "signup".tr(context)),
        verticalSpacing(20),
        Center(
          child: CustomTextRich(
              tittle: "have_an_account".tr(context),
              authText: "login".tr(context),
              routeName: RouteName.login),
        ),
            verticalSpacing(30)
      ],
    ));
  }
}
