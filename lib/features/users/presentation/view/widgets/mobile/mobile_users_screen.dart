import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/features/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';

import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../../core/utils/colors_manger.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';
import '../../../../../../core/widgets/app_text_form_filed.dart';
import '../../../../../../core/widgets/custom_drawer.dart';
import '../get_users_bloc.dart';

class MobileUsersScreen extends StatefulWidget {
  const MobileUsersScreen({super.key});

  @override
  State<MobileUsersScreen> createState() => _MobileUsersScreenState();
}

class _MobileUsersScreenState extends State<MobileUsersScreen> {
  int selectedIndex = 3;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;
  @override
  void dispose() {
    context.read<GetAllUsersBloc>().searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor:
            isDark ? ColorsManger.blackColor : ColorsManger.whiteColor,
        title: Text(
          "users".tr(context),
          style: AppTextStyles.font16BoldFixedFontSize(context),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: isDark ? ColorsManger.whiteColor : ColorsManger.blackColor,
          ),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: CustomDrawerWidget(
        selectedIndex: selectedIndex,
        onItemSelected: _onItemSelected,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
            builder: (context, state) {
              final bloc = context.read<GetAllUsersBloc>();
              return Column(
                children: [
                  AppTextFormFiled(
                    onChanged: (value) {
                      bloc.add(GetAllUsersEvent.searchForUsers(search: value));
                      return null;
                    },
                    controller: bloc.searchController,
                    validator: (value) {},
                    hintText: "search_for_users".tr(context),
                    suffixIcon: IconButton(
                      icon: Icon(
                        bloc.searchController.text.isEmpty
                            ? Icons.search
                            : Icons.clear,
                        size: 28,
                        color: ColorsManger.primaryColor500,
                      ),
                      onPressed: () {
                        bloc.searchController.clear();
                        bloc.add(const GetAllUsersEvent.getAllUsers(isNotLoading: true));
                      },
                    ),
                    hintStyle: AppTextStyles.font16Medium(context),
                  ),
                  verticalSpacing(10.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      child: SizedBox(
                        width: max(MediaQuery.of(context).size.width, 600.w),
                        child: GetUsersBloc(),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
