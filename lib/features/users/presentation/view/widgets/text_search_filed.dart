import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/widgets/app_text_form_filed.dart';
import 'package:shopzen_admin_dashboard/features/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';

import '../../../../../core/utils/colors_manger.dart';
import '../../../../../core/utils/styles/app_text_styles.dart';
import '../../../../../responsive_layout.dart';

class TextSearchFiled extends StatelessWidget {
  const TextSearchFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GetAllUsersBloc>();

    return AppTextFormFiled(
      onChanged: (value) {
        bloc.add(GetAllUsersEvent.searchForUsers(search: value));
        return null;
      },
      controller: bloc.searchController,
      validator: (value) {},
      hintText: "search_for_users".tr(context),
      suffixIcon: IconButton(
        icon: Icon(
          bloc.searchController.text.isEmpty ? Icons.search : Icons.clear,
          size: 28,
          color: ColorsManger.primaryColor500,
        ),
        onPressed: () {
          bloc.searchController.clear();
          bloc.add(const GetAllUsersEvent.getAllUsers(isNotLoading: true));
        },
      ),
      hintStyle: ResponsiveLayout.isDesktop(context)
                ? AppTextStyles.font16RegularThemeColor(context)
                : AppTextStyles.font16MediumFixedFontSizeWhite(context),
    );
  }
}
