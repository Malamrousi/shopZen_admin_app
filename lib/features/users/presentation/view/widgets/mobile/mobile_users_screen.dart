import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';

import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../../core/utils/colors_manger.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';
import '../../../../../../core/widgets/custom_drawer.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: isDark ? ColorsManger.blackColor : ColorsManger.whiteColor,
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
        selectedIndex: selectedIndex,
        onItemSelected: _onItemSelected,
      ),
      body: Center(
        child: Text(
          "إدارة المستخدمين - Mobile",
          style: AppTextStyles.font16Medium(context),
        ),
      ),
    );
  }
}
