import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';

import 'package:shopzen_admin_dashboard/responsive_layout.dart';

import '../../../../../core/cubit/upload_image/upload_image_cubit.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../core/utils/colors_manger.dart';
import '../../../../../core/widgets/custom_bottom_sheet.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../bloc/create_category/create_category_bloc.dart';
import '../../bloc/get_all_categories/get_all_categories_bloc.dart';
import '../create_new_category_bottom_sheet.dart';

class CreateNewCategoryBloc extends StatelessWidget {
  const CreateNewCategoryBloc({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<CreateCategoryBloc>()),
        
      ],
      child: CustomButton(
        onPressed: () async {
          await CustomBottomSheet.showCustomModelBottomSheet(
            context: context,
            color: isDark ? ColorsManger.blackColor : ColorsManger.whiteColor,
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt.get<UploadImageCubit>(),
                ),
              ],
              child: const CreateNewCategoryBottomSheet(),
            ),
            onClosed: () {
              context
                  .read<GetAllCategoriesBloc>()
                  .add(GetAllCategoriesEvent.getAllCategories());
            },
          );
        },
        title: "crate_new".tr(context),
        bottomHeight: ResponsiveLayout.isDesktop(context) ? 30 : 45.h,
        bottomWidth: ResponsiveLayout.isDesktop(context) ? 50.w : 150.w,
        borderRadius: 10.r,
        backgroundColor: ColorsManger.primaryColor400,
      ),
    );
  }
}
