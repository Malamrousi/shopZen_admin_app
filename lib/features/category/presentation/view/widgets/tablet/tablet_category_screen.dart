import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_prefs_key.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';

import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/utils/colors_manger.dart';
import '../../../../../../core/widgets/custom_drawer.dart';

class TabletCategoryScreen extends StatefulWidget {
  const TabletCategoryScreen({super.key});

  @override
  State<TabletCategoryScreen> createState() => _TabletCategoryScreenState();
}

class _TabletCategoryScreenState extends State<TabletCategoryScreen> {
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
      body: Center(
        child: Text("Category Mobile"),
      ),
    );
  }
}
