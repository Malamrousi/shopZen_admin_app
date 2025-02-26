import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';
import 'package:shopzen_admin_dashboard/core/widgets/app_text_form_filed.dart';
import 'package:shopzen_admin_dashboard/core/widgets/custom_button.dart';
import '../../../../../../core/helper/spacing.dart';
import '../../../../../../responsive_layout.dart';

class CreateNotification extends StatefulWidget {
  const CreateNotification({super.key});

  @override
  State<CreateNotification> createState() => _CreateNotificationState();
}

class _CreateNotificationState extends State<CreateNotification> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController productController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    productController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                verticalSpacing(80),
          Text(
            "create_notification".tr(context),
            style: AppTextStyles.font25MediumPrimary700(context),
          ),
          verticalSpacing(40),
          // Image selection container
          AppTextFormFiled(
            controller: titleController,
            onChanged: (value) {},
            validator: (value) {},
            hintText: "notification_title".tr(context),
            hintStyle: ResponsiveLayout.isDesktop(context)
                ? AppTextStyles.font16RegularThemeColor(context)
                : AppTextStyles.font16MediumFixedFontSize(context),
          ),
      
          verticalSpacing(30),
          // Image selection container
          AppTextFormFiled(
            controller: bodyController,
            onChanged: (value) {},
            validator: (value) {},
            hintText: "notification_description".tr(context),
            hintStyle: ResponsiveLayout.isDesktop(context)
                ? AppTextStyles.font16RegularThemeColor(context)
                : AppTextStyles.font16MediumFixedFontSize(context),
          ),
      
          verticalSpacing(30),
          // Image selection container
          AppTextFormFiled(
            controller: productController,
            onChanged: (value) {},
            validator: (value) {},
            hintText: "product_id".tr(context),
            hintStyle: ResponsiveLayout.isDesktop(context)
                ? AppTextStyles.font16RegularThemeColor(context)
                : AppTextStyles.font16MediumFixedFontSize(context),
          ),
          verticalSpacing(30),
          CustomButton(
            onPressed: () {},
            title: "push_notification".tr(context),
            backgroundColor:  ColorsManger.primaryColor400,
            textStyle: AppTextStyles.font16Regular(context),
          ),
  verticalSpacing(80)
        ],
      ),
    );
  }
}
