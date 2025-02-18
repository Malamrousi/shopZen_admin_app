import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/colors_manger.dart';
import '../../../../core/utils/styles/app_text_styles.dart';
import '../../../../core/widgets/app_text_form_filed.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../responsive_layout.dart';
import 'update_upload_image.dart';

class UpdateNewCategoryBottomSheet extends StatefulWidget {
  const UpdateNewCategoryBottomSheet({super.key});

  @override
  State<UpdateNewCategoryBottomSheet> createState() =>
      _UpdateNewCategoryBottomSheetState();
}

class _UpdateNewCategoryBottomSheetState
    extends State<UpdateNewCategoryBottomSheet> {
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
              "update_category".tr(context),
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
            UpdateUploadImage(
              imageUrl: '',
            ),
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
              onPressed: () {},
              title: "update_category".tr(context),
              backgroundColor: ColorsManger.primaryColor400,
              textStyle: ResponsiveLayout.isDesktop(context)
                  ? AppTextStyles.font16Regular(context)
                  : AppTextStyles.font12Regular(context),
            )
          ],
        ),
      ),
    );
    
  }
}
