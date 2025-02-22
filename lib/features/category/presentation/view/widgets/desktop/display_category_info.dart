import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/cubit/upload_image/upload_image_cubit.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/core/widgets/custom_bottom_sheet.dart';
import 'package:shopzen_admin_dashboard/core/widgets/custom_button.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../../core/utils/colors_manger.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';
import '../../../../../../core/widgets/app_text_form_filed.dart';
import '../../../../../../responsive_layout.dart';
import '../../../bloc/create_category/create_category_bloc.dart';
import '../../create_new_category_bottom_sheet.dart';
import '../get_all_categories_bloc.dart';

class DisplayCategoryInfo extends StatelessWidget {
  const DisplayCategoryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          verticalSpacing(40),
          AppTextFormFiled(
            onChanged: (value) {},
            validator: (value) {},
            hintText: "search_for_category".tr(context),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.search,
                size: 28,
                color: ColorsManger.primaryColor400,
              ),
              onPressed: () {},
            ),
            hintStyle: ResponsiveLayout.isDesktop(context)
                ? AppTextStyles.font16RegularThemeColor(context)
                : AppTextStyles.font16MediumFixedFontSizeWhite(context),
          ),
          verticalSpacing(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "categories".tr(context),
                style: AppTextStyles.font24Bold(context),
              ),
              MultiBlocProvider(
                providers: [
                  BlocProvider(
                      create: (context) => getIt.get<CreateCategoryBloc>()),
                  BlocProvider(
                      create: (context) => getIt.get<UploadImageCubit>()),
                ],
                child: CustomButton(
                  onPressed: () {
                    CustomBottomSheet.showCustomModelBottomSheet(
                      context: context,
                      color: isDark
                          ? ColorsManger.blackColor
                          : ColorsManger.whiteColor,
                      child: CreateNewCategoryBottomSheet(),
                    );
                  },
                  title: "crate_new".tr(context),
                  bottomHeight: 30,
                  bottomWidth: 50.w,
                  borderRadius: 10.r,
                  backgroundColor: ColorsManger.primaryColor400,
                ),
              ),
            ],
          ),
          verticalSpacing(40),
          Flexible(
              child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: GetAllCategoriesDataBloc(),
              )
            ],
          )),
        ],
      ),
    );
  }
}
