
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_prefs_key.dart';

import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/utils/colors_manger.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';
import '../../../../../../core/widgets/app_text_form_filed.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_drawer.dart';
import '../../../../../../responsive_layout.dart';
import '../category_table.dart';

class MobileCategoryScreen extends StatefulWidget {
  const MobileCategoryScreen({super.key});

  @override
  State<MobileCategoryScreen> createState() => _MobileCategoryScreenState();
}

class _MobileCategoryScreenState extends State<MobileCategoryScreen> {
  int _selectedIndex = 2;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor:
            isDark ? ColorsManger.blackColor : ColorsManger.whiteColor,
        title: Text(
          "shop_zen_admin".tr(context),
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
        onItemSelected: _onItemSelected,
        selectedIndex: _selectedIndex,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
             verticalSpacing(10.h),
          AppTextFormFiled(
            onChanged: (value) {},
            validator: (value) {},
            hintText: "search_for_category".tr(context),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.search,
                size: 26,
                color: ColorsManger.primaryColor400,
              ),
              onPressed: () {},
            ),
            hintStyle: ResponsiveLayout.isDesktop(context)
                ? AppTextStyles.font16RegularThemeColor(context)
                : AppTextStyles.font16MediumFixedFontSizeWhite(context),
          ),
          verticalSpacing(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "categories".tr(context),
                style: AppTextStyles.font16BoldFixedFontSize(context),
              ),
              CustomButton(
                onPressed: () {},
                title: "crate_new".tr(context),
                bottomHeight: 45.h,
                bottomWidth: 150.w,
                borderRadius: 10,
                backgroundColor: ColorsManger.primaryColor400,
              ),
            ],
          ),
              verticalSpacing(10.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  child: SizedBox(
                    width: max(MediaQuery.of(context).size.width, 800.w),
                    child: CategoryTable(),
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
