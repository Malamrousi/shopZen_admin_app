import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/helper/extension.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_pref.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_prefs_key.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/custom_linear_button.dart';

import '../../../../../core/cubit/upload_image/upload_image_cubit.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../../core/utils/colors_manger.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../../../core/widgets/custom_button.dart';

class CustomSignUpButton extends StatelessWidget {
  const CustomSignUpButton({super.key, this.textStyle});
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(success: (_) async {
          ShowToast.showToastSuccessTop(
            message: "sign_up_successfully".tr(context),
            seconds: 2,
          );
             SharedPref().setString(PrefKeys.isLogin, "true");

          context.pushNamed(RouteName.home);
        }, failure: (message) {
          log(message);
        });
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return CustomLinearButton(
              onPressed: () {},
              height: 40.h,
              width: double.infinity,
              child: CircularProgressIndicator(
                color: ColorsManger.whiteColor,
              ),
            );
          },
          orElse: () => CustomButton(
            onPressed: () {
              _validateThenSignUp(context);
            },
            title: "signup".tr(context),
            backgroundColor: ColorsManger.primaryColor400,
            textStyle:textStyle?? AppTextStyles.font16Regular(context),
          ),
        );
      },
    );
  }

  void _validateThenSignUp(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final imageCubit = context.read<UploadImageCubit>();
    if (!authBloc.formKey.currentState!.validate() ||
        imageCubit.imageUrl.isEmpty) {
      if (imageCubit.imageUrl.isEmpty) {
        ShowToast.showToastErrorTop(
          message: "please_upload_image".tr(context),
        );
      }
    } else {
      context.read<AuthBloc>().add(
            AuthEvent.signUp(imageUrl: imageCubit.imageUrl),
          );
    }
  }
}
