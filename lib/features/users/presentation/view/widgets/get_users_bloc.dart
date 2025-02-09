import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/features/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:shopzen_admin_dashboard/features/users/presentation/view/widgets/user_table.dart';

import '../../../../../core/utils/colors_manger.dart';
import '../../../../../core/utils/styles/app_text_styles.dart';

class GetUsersBloc extends StatelessWidget {
  const GetUsersBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
      builder: (context, state) {
        return state.when(
          loading: () {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsManger.primaryColor400,
              ),
            );
          },
          success: (users) {
            return UserTable(
              users: users,
            );
          },
          search: (searchUserList) {
          return   UserTable(
              users: searchUserList,
            );
          },
          empty: () {
            return  Center(
              child: Text("no_users_found".tr(context),
                  style: AppTextStyles.font16BoldFixedFontSize(context)),
            );
          },
          failure: (message) {
            return Center(
              child: Text("error_while_fetching_users".tr(context),
                  style: AppTextStyles.font16BoldFixedFontSize(context)),
            );
          },
        );
      },
    );
  }
}
