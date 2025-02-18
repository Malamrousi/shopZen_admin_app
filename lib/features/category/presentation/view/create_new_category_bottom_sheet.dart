import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';
import 'package:shopzen_admin_dashboard/core/widgets/custom_button.dart';
import 'package:shopzen_admin_dashboard/responsive_layout.dart';

import '../../../../core/utils/styles/app_text_styles.dart';
import '../../../../core/widgets/app_text_form_filed.dart';
import 'category_upload_image.dart';

class CreateNewCategoryBottomSheet extends StatefulWidget {
  const CreateNewCategoryBottomSheet({super.key});

  @override
  State<CreateNewCategoryBottomSheet> createState() =>
      _CreateNewCategoryBottomSheetState();
}

class _CreateNewCategoryBottomSheetState
    extends State<CreateNewCategoryBottomSheet> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "create_new_category".tr(context),
              style: ResponsiveLayout.isDesktop(context)
                  ? AppTextStyles.font31Medium(context)
                  : AppTextStyles.font16MediumFixedFontSize(context),
            ),
            verticalSpacing(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "add_image".tr(context),
                  style: ResponsiveLayout.isDesktop(context)
                      ? AppTextStyles.font24Bold(context)
                      : AppTextStyles.font12RegularFixedFontSize(context),
                ),
                CustomButton(
                  onPressed: () {},
                  title: "remove".tr(context),
                  backgroundColor: ColorsManger.alertColorRed600,
                  textStyle: ResponsiveLayout.isDesktop(context)
                      ? AppTextStyles.font16Regular(context)
                      : AppTextStyles.font12Regular(context),
                  bottomHeight: 40.h,
                  bottomWidth: 50.w,
                )
              ],
            ),
            verticalSpacing(20),
            CategoryUploadImage(),
                        verticalSpacing(20),

            Text(
              "enter_the_category_name".tr(context),
              style: ResponsiveLayout.isDesktop(context)
                  ? AppTextStyles.font20Regular(context)
                  : AppTextStyles.font12RegularFixedFontSize(context),
            ),
            verticalSpacing(20),
            AppTextFormFiled(
              onChanged: (value) {},
              validator: (value) {},
              hintText: "category_name".tr(context),
              hintStyle: ResponsiveLayout.isDesktop(context)
                  ? AppTextStyles.font16RegularThemeColor(context)
                  : AppTextStyles.font16MediumFixedFontSizeWhite(context),
            ),
            verticalSpacing(20),
            CustomButton(
                  onPressed: () {
                  },
                  title: "create_new_category".tr(context),
                  backgroundColor: ColorsManger.primaryColor400,
                  textStyle:  ResponsiveLayout.isDesktop(context)
                      ? AppTextStyles.font16Regular(context)
                      : AppTextStyles.font12Regular(context),
                
        )],
        ),
      ),
    );
  }
}
