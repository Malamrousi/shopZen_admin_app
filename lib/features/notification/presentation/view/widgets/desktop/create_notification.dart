import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';
import 'package:shopzen_admin_dashboard/core/utils/show_toast.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';
import 'package:shopzen_admin_dashboard/core/widgets/app_text_form_filed.dart';
import 'package:shopzen_admin_dashboard/core/widgets/custom_button.dart';
import 'package:shopzen_admin_dashboard/features/notification/presentation/bloc/add_notification/add_notification_bloc.dart';
import '../../../../../../core/helper/spacing.dart';
import '../../../../../../responsive_layout.dart';
import '../../../../data/model/add_notification_model.dart';

class CreateNotification extends StatefulWidget {
  const CreateNotification({super.key});

  @override
  State<CreateNotification> createState() => _CreateNotificationState();
}

class _CreateNotificationState extends State<CreateNotification> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController productController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
      child: Form(
        key: formKey,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "enter_notification_title".tr(context);
                }
                return null;
              },
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "enter_notification_description".tr(context);
                }
                return null;
              },
              hintText: "notification_description".tr(context),
              hintStyle: ResponsiveLayout.isDesktop(context)
                  ? AppTextStyles.font16RegularThemeColor(context)
                  : AppTextStyles.font16MediumFixedFontSize(context),
            ),

            verticalSpacing(30),
            // Image selection container
            AppTextFormFiled(
              controller: productController,
              validator: (value) {
                return null;
              },
              hintText: "product_id".tr(context),
              hintStyle: ResponsiveLayout.isDesktop(context)
                  ? AppTextStyles.font16RegularThemeColor(context)
                  : AppTextStyles.font16MediumFixedFontSize(context),
            ),
            verticalSpacing(30),
            BlocConsumer<AddNotificationBloc, AddNotificationState>(
              listener: (context, state) {
                state.whenOrNull(success: () {
                  ShowToast.showToastSuccessTop(
                    message: "notification_created_successfully".tr(context),
                    seconds: 2,
                  );

                },
                failure: (message) {
                  
                  ShowToast.showToastErrorTop(
                    message: "notification_created_failed".tr(context),
                    seconds: 3,
                  );
                },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                    loading: () {
                      return Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color: ColorsManger.gray200,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    orElse: () => CustomButton(
                          onPressed: () {
                            validateForm(context);
                          },
                          title: "push_notification".tr(context),
                          backgroundColor: ColorsManger.primaryColor400,
                          textStyle: AppTextStyles.font16Regular(context),
                        ));
              },
            ),
            verticalSpacing(80)
          ],
        ),
      ),
    );
  }

  void validateForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context
          .read<AddNotificationBloc>()
          .add(AddNotificationEvent.createNotification(
              addNotificationModel: AddNotificationModel(
            title: titleController.text.trim(),
            body: bodyController.text.trim(),
            productId: int.parse(productController.text.trim()),
            createAt: DateTime.now(),
          )));
    }
  }
}
