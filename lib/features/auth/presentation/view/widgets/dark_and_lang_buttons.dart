import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';

import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';

import '../../../../../core/animations/animate_do.dart';
import '../../../../../core/app/app_localizations.dart';
import '../../../../../core/cubit/app_cubit/app_cubit.dart';
import 'custom_linear_button.dart';

class DarkAndLangButtons extends StatelessWidget {
  const DarkAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return CustomFadeInRight(
              duration: 800,
              child: CustomLinearButton(
                height: 44,
                width: 44,
                onPressed: cubit.changeAppThemeMode,
                child: Icon(
                  cubit.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        horizontalSpacing(20),
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {
              if (cubit.currentLangCode == ENGLISH) {
                cubit.toArabic();
              } else {
                cubit.toEnglish();
              }
            },
            height: 44,
            width: 100,
            child: Text(
              cubit.currentLangCode == ENGLISH
                  ? "arabic".tr(context)
                  : "english".tr(context),
              style: AppTextStyles.font16Regular(context),
            ),
          ),
        ),
      ],
    );
  }
}