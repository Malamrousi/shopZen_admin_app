import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/utils/show_toast.dart';
import 'package:shopzen_admin_dashboard/features/users/presentation/bloc/delete_user/delete_users_bloc.dart';

import '../../../../../core/utils/colors_manger.dart';
import '../../../../../responsive_layout.dart';
import '../../bloc/get_all_users/get_all_users_bloc.dart';

class DeleteUserIcon extends StatelessWidget {
  const DeleteUserIcon({
    super.key,
    required this.userId,
  });
  final String userId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteUsersBloc, DeleteUsersState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context
                .read<GetAllUsersBloc>()
                .add(const GetAllUsersEvent.getAllUsers(isNotLoading: false));
            if (!kIsWeb) {
              ShowToast.showToastSuccessTop(
                  message: "delete_user_successfully".tr(context), seconds: 2);
            }
          },
          failure: (message) {
            ShowToast.showToastErrorTop(
                message: "error_when_delete_user".tr(context), seconds: 2);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (userId) {
            if (this.userId == userId) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: ColorsManger.alertColorRed500,
                ),
              );
            } else {
              return Icon(
                Icons.delete,
                size: ResponsiveLayout.isDesktop(context) ? 30 : 17.sp,
                color: ColorsManger.alertColorRed500,
              );
            }
          },
          orElse: () => InkWell(
            onTap: () {
              context
                  .read<DeleteUsersBloc>()
                  .add(DeleteUsersEvent.deleteUser(userId: userId));
            },
            child: Icon(
              Icons.delete,
              size: ResponsiveLayout.isDesktop(context) ? 30 : 17.sp,
              color: ColorsManger.alertColorRed500,
            ),
          ),
        );
      },
    );
  }
}
