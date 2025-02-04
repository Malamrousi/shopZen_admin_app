import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/app/app_regex.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/core/routes/route_name.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/custom_sign_up_button.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/custom_text_rich.dart';

import '../../../../../../core/utils/styles/app_text_styles.dart';
import '../../../../../../core/widgets/app_text_form_filed.dart';

class TabletSignUpForm extends StatefulWidget {
  const TabletSignUpForm({super.key});

  @override
  State<TabletSignUpForm> createState() => _TabletSignUpFormState();
}

class _TabletSignUpFormState extends State<TabletSignUpForm> {
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
      key: context.read<AuthBloc>().formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("name".tr(context),
              style:
                  AppTextStyles.font14RegularThemeColorFixedFontSize(context)),
          verticalSpacing(20),
          AppTextFormFiled(
            controller: signUpBloc.nameController,
            hintText: "enter_name".tr(context),
            hintStyle: AppTextStyles.font12RegularFixedFontSize(context),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "enter_name".tr(context);
              }
              return null;
            },
          ),
          verticalSpacing(20),
          Text("email".tr(context),
              style:
                  AppTextStyles.font14RegularThemeColorFixedFontSize(context)),
          verticalSpacing(20),
          AppTextFormFiled(
            controller: signUpBloc.emailController,
            hintText: "enter_email".tr(context),
            hintStyle: AppTextStyles.font12RegularFixedFontSize(context),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please_enter_email".tr(context);
              }
              return null;
            },
          ),
          verticalSpacing(20),
          Text("password".tr(context),
              style:
                  AppTextStyles.font14RegularThemeColorFixedFontSize(context)),
          verticalSpacing(20),
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
            hintStyle: AppTextStyles.font12RegularFixedFontSize(context),
          ),
          verticalSpacing(50),
          CustomSignUpButton(
            textStyle: AppTextStyles.font15WhiteColorRegularFixedFontSize(context),
          ),
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
