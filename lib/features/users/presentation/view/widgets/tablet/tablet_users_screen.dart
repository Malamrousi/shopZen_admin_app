import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';

import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../../core/utils/colors_manger.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';
import '../../../../../../core/widgets/custom_drawer.dart';
import '../get_users_bloc.dart';
import '../text_search_filed.dart';


class TabletUsersScreen extends StatefulWidget {
  const TabletUsersScreen({super.key});

  @override
  State<TabletUsersScreen> createState() => _TabletUsersScreenState();
}

class _TabletUsersScreenState extends State<TabletUsersScreen> {
  int selectedIndex = 3;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: isDark ? ColorsManger.blackColor : ColorsManger.whiteColor,
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
      body:Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextSearchFiled(),
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
          ),
        ),
      ),
    );
  }
}
