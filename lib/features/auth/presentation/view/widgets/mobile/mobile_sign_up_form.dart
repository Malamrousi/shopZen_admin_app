import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/routes/route_name.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';
import 'package:shopzen_admin_dashboard/core/widgets/app_text_form_filed.dart';
import '../../../../../../core/app/app_regex.dart';
import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/utils/colors_manger.dart';
import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../custom_sign_up_button.dart';
import '../custom_text_rich.dart';

class MobileSignUpForm extends StatefulWidget {
  const MobileSignUpForm({super.key});

  @override
  State<MobileSignUpForm> createState() => _MobileSignUpFormState();
}

class _MobileSignUpFormState extends State<MobileSignUpForm> {
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("name".tr(context),
                style: AppTextStyles.font14RegularThemeColorFixedFontSize(
                    context)),
            verticalSpacing(5.h),
            AppTextFormFiled(
              hintText: "enter_name".tr(context),
              hintStyle: AppTextStyles.font12RegularFixedFontSize(context),
              controller: signUpBloc.nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "enter_name".tr(context);
                }
                return null;
              },
            ),
            verticalSpacing(10.h),
            Text("email".tr(context),
                style: AppTextStyles.font14RegularThemeColorFixedFontSize(
                    context)),
            verticalSpacing(5.h),
            AppTextFormFiled(
              hintText: "enter_email".tr(context),
              hintStyle: AppTextStyles.font12RegularFixedFontSize(context),
              controller: signUpBloc.emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please_enter_email".tr(context);
                }
                return null;
              },
            ),
            verticalSpacing(10.h),
            Text("password".tr(context),
                style: AppTextStyles.font14RegularThemeColorFixedFontSize(
                    context)),
            verticalSpacing(5.h),
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
            verticalSpacing(40.h),
            CustomSignUpButton(
              textStyle:   AppTextStyles.font15WhiteColorRegularFixedFontSize(context),
            ),
            verticalSpacing(40),
            Center(
                child: CustomTextRich(
                    textAuthStyle:
                        AppTextStyles.font16MediumPrimary700FixedFontSize(
                            context),
                    tittle: "dont_have_an_account".tr(context),
                    textStyle:
                        AppTextStyles.font14RegularThemeColorFixedFontSize(
                            context),
                    authText: "signup".tr(context),
                    routeName: RouteName.login))
          ],
        ));
  }
}
