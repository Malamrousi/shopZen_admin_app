import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/helper/extension.dart';
import 'package:shopzen_admin_dashboard/core/routes/route_name.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_pref.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

import '../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../core/utils/colors_manger.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../../../core/utils/styles/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'custom_linear_button.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({super.key, this.textStyle});
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (userRole) async {
            ShowToast.showToastSuccessTop(
              message: "login_success".tr(context),
              seconds: 2,
            );
            
              SharedPref().setString(PrefKeys.isLogin, "true");

              context.pushNamed(RouteName.home);
            
          },
          failure: (message) {
            ShowToast.showToastErrorTop(
              message: "please_try_again_we_have_error".tr(context),
              seconds: 3,
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => CustomLinearButton(
                  onPressed: () {},
                  height: 40,
                  width: double.infinity,
                  child: CircularProgressIndicator(
                    color: ColorsManger.whiteColor,
                  ),
                ),
            orElse: () => CustomButton(
                  onPressed: () {
                    _validateThenLogin(context);
                  },
                  title: "login".tr(context),
                  backgroundColor: ColorsManger.primaryColor400,
                  textStyle:textStyle ?? AppTextStyles.font16Regular(context),
                ));
      },
    );
  }

  void _validateThenLogin(BuildContext context) {
    if (context.read<AuthBloc>().formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(const AuthEvent.login());
    }
  }
}
