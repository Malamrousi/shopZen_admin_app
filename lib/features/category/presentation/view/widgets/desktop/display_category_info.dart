import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/core/widgets/custom_button.dart';

import '../../../../../../core/utils/colors_manger.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';
import '../../../../../../core/widgets/app_text_form_filed.dart';
import '../../../../../../responsive_layout.dart';
import '../category_table.dart';

class DisplayCategoryInfo extends StatelessWidget {
  const DisplayCategoryInfo({super.key});

  @override
  Widget build(BuildContext context) {
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
              CustomButton(
                onPressed: () {},
                title: "crate_new".tr(context),
                bottomHeight: 30,
                bottomWidth: 50.w,
                borderRadius: 10.r,
                backgroundColor: ColorsManger.primaryColor400,
              ),
            ],
          ),
          verticalSpacing(40),
              Flexible(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CategoryTable(),
                )
              ],
            )),
        ],
      ),
    );
  }
}
