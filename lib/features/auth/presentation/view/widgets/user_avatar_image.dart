import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shopzen_admin_dashboard/core/animations/animate_do.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/helper/theme_extension.dart';
import 'package:shopzen_admin_dashboard/core/utils/colors_manger.dart';

import '../../../../../core/assets/assets.dart';
import '../../../../../core/cubit/upload_image/upload_image_cubit.dart';
import '../../../../../core/utils/show_toast.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 500,
      child: BlocConsumer<UploadImageCubit, UploadImageState>(
        listener: (context, state) {
          state.whenOrNull(success: () {
            ShowToast.showToastSuccessTop(
              message: "image_uploaded_successfully".tr(context),
              seconds: 2,
            );
          },
          failure: (message) {
            ShowToast.showToastErrorTop(
              message: "image_upload_failed".tr(context),
              seconds: 3,
            );
          },
          remove: (remove) {
            ShowToast.showToastSuccessTop(
              message: "image_removed_successfully".tr(context),
              seconds: 2,
            );
          }
          );
        
          
        },
        builder: (context, state) {
          final isImageUploaded =
              context.read<UploadImageCubit>().imageUrl.isNotEmpty;
          return state.maybeWhen(loading: () {
            return CircleAvatar(
              radius: 38,
              backgroundImage: AssetImage(Assets.imagesUserAvatar),
              child: CircularProgressIndicator(
                color: context.colorThemeExtension.mainColor,
              ),
            );
          }, orElse: () {
            return CircleAvatar(
              radius: 50.r,
              backgroundImage: isImageUploaded
                  ? NetworkImage(context.read<UploadImageCubit>().imageUrl)
                  : AssetImage(Assets.imagesUserAvatar),
              backgroundColor: Colors.black.withOpacity(.2),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: 180.w,
                    height: 180.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black.withOpacity(.1),
                        width: 4.w,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -10,
                    right: -5,
                    child: isImageUploaded
                        ? IconButton(
                            onPressed: () {
                              context.read<UploadImageCubit>().removeImage();
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 28,
                              color: Colors.red,
                            ),
                            color: ColorsManger.whiteColor,
                          )
                        : SizedBox.shrink(),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<UploadImageCubit>().uploadImage();
                    },
                    icon: isImageUploaded
                        ? Icon(
                            Icons.edit,
                            size: 28,
                          )
                        : Icon(
                            Icons.add_a_photo,
                            size: 28,
                          ),
                    color: ColorsManger.whiteColor,
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}