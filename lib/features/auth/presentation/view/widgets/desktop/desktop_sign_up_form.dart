import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/core/routes/route_name.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';
import 'package:shopzen_admin_dashboard/core/widgets/app_text_form_filed.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/custom_text_rich.dart';

import '../../../../../../core/app/app_regex.dart';
import '../../../../../../core/utils/colors_manger.dart';
import '../custom_sign_up_button.dart';

class DesktopSignUpForm extends StatefulWidget {
  const DesktopSignUpForm({super.key});

  @override
  State<DesktopSignUpForm> createState() => _DesktopSignUpFormState();
}

class _DesktopSignUpFormState extends State<DesktopSignUpForm> {
  bool isObscureText = true;
  late AuthBloc signUpBloc;

  @override
  void initState() {
    super.initState();
    signUpBloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    signUpBloc.emailController.dispose();
    signUpBloc.passwordController.dispose();
    signUpBloc.nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: signUpBloc.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("name".tr(context),
                style: AppTextStyles.font16RegularThemeColor(context)),
            verticalSpacing(10),
            AppTextFormFiled(
              hintText: "enter_name".tr(context),
              controller: signUpBloc.nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "enter_name".tr(context);
                }
                return null;
              },
            ),
            verticalSpacing(20),
            Text("email".tr(context),
                style: AppTextStyles.font16RegularThemeColor(context)),
            verticalSpacing(10),
            AppTextFormFiled(
              hintText: "enter_email".tr(context),
              controller: signUpBloc.emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please_enter_email".tr(context);
                } 
                return null;
              },
            ),
            verticalSpacing(20),
            Text("password".tr(context),
                style: AppTextStyles.font16RegularThemeColor(context)),
            verticalSpacing(10),
            AppTextFormFiled(
              controller: signUpBloc.passwordController,
              isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  isObscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: ColorsManger.gray600,
                ),
              ),
              hintText: "enter_password".tr(context),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please_enter_password".tr(context);
                } else if (AppRegex.isPasswordValid(
                    signUpBloc.passwordController.text)) {
                  return "please_enter_valid_password".tr(context);
                }
                return null;
              },
            ),
            verticalSpacing(50),
            CustomSignUpButton(),
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
