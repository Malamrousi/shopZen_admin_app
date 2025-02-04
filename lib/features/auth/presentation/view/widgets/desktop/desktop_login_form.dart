import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/core/routes/route_name.dart';
import 'package:shopzen_admin_dashboard/core/widgets/app_text_form_filed.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/custom_login_button.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/custom_text_rich.dart';

import '../../../../../../core/app/app_regex.dart';
import '../../../../../../core/utils/colors_manger.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';

class DesktopLoginForm extends StatefulWidget {
  const DesktopLoginForm({super.key});

  @override
  State<DesktopLoginForm> createState() => _DesktopLoginFormState();
}

class _DesktopLoginFormState extends State<DesktopLoginForm> {
  bool isObscureText = true;
  late AuthBloc _loginBloc;
  @override
  void initState() {
    super.initState();
    _loginBloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.emailController.dispose();
    _loginBloc.passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthBloc>().formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("email".tr(context),
              style: AppTextStyles.font16RegularThemeColor(context)),
          verticalSpacing(10),
          AppTextFormFiled(
            controller: _loginBloc.emailController,
            hintText: "enter_email".tr(context),
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
                )),
            controller: _loginBloc.passwordController,
            hintText: "enter_password".tr(context),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please_enter_password".tr(context);
              } else if (AppRegex.isPasswordValid(
                  _loginBloc.passwordController.text)) {
                return "please_enter_valid_password".tr(context);
              }
              return null;
            },
          ),
          verticalSpacing(50),
          CustomLoginButton(),
          verticalSpacing(20),
          Center(
            child: CustomTextRich(
                tittle: "dont_have_an_account".tr(context),
                authText: "signup".tr(context),
                routeName: RouteName.signUp),
          ),
          verticalSpacing(30)
        ],
      ),
    );
  }
}
