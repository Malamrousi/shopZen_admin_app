import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/cubit/upload_image/upload_image_cubit.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';

import '../../../../core/utils/show_toast.dart';

class CategoryUploadImage extends StatelessWidget {
  const CategoryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        state.whenOrNull(success: () {
          ShowToast.showToastSuccessTop(
            message: "image_uploaded_successfully".tr(context),
            seconds: 2,
          );
        }, failure: (message) {
          ShowToast.showToastErrorTop(
            message: "image_upload_failed".tr(context),
            seconds: 3,
          );
        }, remove: (remove) {
          ShowToast.showToastSuccessTop(
            message: "image_removed_successfully".tr(context),
            seconds: 2,
          );
        });
      },
      builder: (context, state) {
        final cubit = context.read<UploadImageCubit>();
        return state.maybeWhen(loading: () {
          return Container(
            height: 200.h,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: ColorsManger.gray200,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }, orElse: () {
          if (cubit.imageUrl.isNotEmpty) {
            return Container(
              height: 200.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: ColorsManger.gray200,
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: NetworkImage(cubit.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            );
          } else {
            return InkWell(
              onTap: () {
                context.read<UploadImageCubit>()..uploadImage();
              },
              child: Container(
                height: 200.h,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: ColorsManger.gray200,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.add_a_photo_outlined,
                  size: 50,
                  color: ColorsManger.whiteColor,
                ),
              ),
            );
          }
        });
      },
    );
  }
}
