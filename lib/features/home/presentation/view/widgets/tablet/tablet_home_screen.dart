import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_prefs_key.dart';
import 'package:shopzen_admin_dashboard/core/widgets/custom_drawer.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/view/widgets/mobile/dash_board_widget.dart';
import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/utils/colors_manger.dart';
class TabletHomeScreen extends StatefulWidget {
  const TabletHomeScreen({super.key});


  @override
  State<TabletHomeScreen> createState() => _TabletHomeScreenState();
}

class _TabletHomeScreenState extends State<TabletHomeScreen> {
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
  return  Scaffold(
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
      body:DashBoardWidget(),
    );
  }
}

