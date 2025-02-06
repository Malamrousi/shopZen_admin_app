import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';

import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../../core/utils/colors_manger.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';
import '../../../../../../core/widgets/custom_drawer.dart';

class MobileCustomerServicesScreen extends StatefulWidget {
  const MobileCustomerServicesScreen({super.key});

  @override
  State<MobileCustomerServicesScreen> createState() => _MobileCustomerServicesScreenState();
}

class _MobileCustomerServicesScreenState extends State<MobileCustomerServicesScreen> {
        void _onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
    int selectedIndex = 6;
      final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;
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
      selectedIndex: selectedIndex,
      ),
      body: Center(child: Text("customer_services Mobile"),),
    );
  }
}