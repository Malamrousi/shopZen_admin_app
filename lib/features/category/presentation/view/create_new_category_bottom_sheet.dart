import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/cubit/upload_image/upload_image_cubit.dart';
import 'package:shopzen_admin_dashboard/core/helper/extension.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';
import 'package:shopzen_admin_dashboard/core/widgets/custom_button.dart';
import 'package:shopzen_admin_dashboard/features/category/data/models/create_category_request_body.dart';
import 'package:shopzen_admin_dashboard/features/category/presentation/bloc/create_category/create_category_bloc.dart';
import 'package:shopzen_admin_dashboard/features/home/data/model/admin_bar_model.dart';
import 'package:shopzen_admin_dashboard/responsive_layout.dart';

import '../../../../core/utils/show_toast.dart';
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
  final bloc = context!.read<CreateCategoryBloc>();
  @override
  void dispose() {
    bloc.controller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: bloc.formKey,
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
                BlocBuilder<UploadImageCubit, UploadImageState>(
                  builder: (context, state) {
                    if (context.read<UploadImageCubit>().imageUrl.isEmpty) {
                      return SizedBox.shrink();
                    } else {
                      return CustomButton(
                        onPressed: () {
                          context.read<UploadImageCubit>().removeImage();
                        },
                        title: "remove".tr(context),
                        backgroundColor: ColorsManger.alertColorRed600,
                        textStyle: ResponsiveLayout.isDesktop(context)
                            ? AppTextStyles.font16Regular(context)
                            : AppTextStyles.font12Regular(context),
                        bottomHeight: 40.h,
                        bottomWidth: 50.w,
                      );
                    }
                  },
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
              controller: bloc.controller,
              onChanged: (value) {},
              validator: (value) {},
              hintText: "category_name".tr(context),
              hintStyle: ResponsiveLayout.isDesktop(context)
                  ? AppTextStyles.font16RegularThemeColor(context)
                  : AppTextStyles.font16MediumFixedFontSize(context),
            ),
            verticalSpacing(20),
            BlocConsumer<CreateCategoryBloc, CreateCategoryState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    context.pop();
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(loading: () {
                  return Container(
                    height: 50,
                    width: MediaQuery.sizeOf(context).width,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  );
                }, orElse: () {
                  return CustomButton(
                    onPressed: () {
                      _validateCreateCategory(context);
                    },
                    title: "create_new_category".tr(context),
                    backgroundColor: ColorsManger.primaryColor400,
                    textStyle: ResponsiveLayout.isDesktop(context)
                        ? AppTextStyles.font16Regular(context)
                        : AppTextStyles.font12Regular(context),
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }

  void _validateCreateCategory(BuildContext context) {
    if (bloc.formKey.currentState!.validate() ||
        context.read<UploadImageCubit>().imageUrl.isEmpty) {
      if (context.read<UploadImageCubit>().imageUrl.isEmpty) {
        ShowToast.showToastErrorTop(
          message: "please_upload_image".tr(context),
        );
      } else {
        bloc.add(CreateCategoryEvent.createCategory(
            category: CreateCategoryRequestBody(
                image: context.read<UploadImageCubit>().imageUrl,
                name: bloc.controller.text.trim())));
      }
    }
  }
}
