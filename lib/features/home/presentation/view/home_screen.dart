import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/utils/styles/app_text_styles.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/view/widgets/desktop/desktop_home_screen.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/view/widgets/mobile/mobile_home_screen.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/view/widgets/tablet/tablet_home_screen.dart';
import 'package:shopzen_admin_dashboard/responsive_layout.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/shared_pref/shared_pref.dart';
import '../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../core/utils/colors_manger.dart';
import 'widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileLayout(),
      tablet: _buildTabletLayout(),
      desktop: DesktopHomeScreen(),
    );
  }

  Widget _buildMobileLayout() {
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
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected,
      ),
      body: MobileHomeScreen(
        selectedIndex: _selectedIndex,
      ),
    );

    
  }
 
  Widget _buildTabletLayout() {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:
              isDark ? ColorsManger.blackColor : ColorsManger.whiteColor,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 23.sp,
              color: isDark ? ColorsManger.whiteColor : ColorsManger.blackColor,
            ),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
        ),
        drawer: CustomDrawerWidget(
          selectedIndex: _selectedIndex,
          onItemSelected: _onItemSelected,
        ),
        body: TabletHomeScreen(
          selectedIndex: _selectedIndex,
        ));
  }
}
