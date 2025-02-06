import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';

import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../../core/utils/colors_manger.dart';
import '../../../../../../core/widgets/custom_drawer.dart';

class MobileProductScreen extends StatefulWidget {
  const MobileProductScreen({super.key});

  @override
  State<MobileProductScreen> createState() => _MobileProductScreenState();
}

class _MobileProductScreenState extends State<MobileProductScreen> {
  int selectedIndex = 1;
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
          "إدارة المنتجات - Mobile",
          style: AppTextStyles.font16Medium(context),
        ),
      ),
    );
  }
}
