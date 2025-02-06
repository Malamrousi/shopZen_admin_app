import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_prefs_key.dart';

import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/widgets/custom_drawer.dart';

class DesktopCategoryBodyScreen extends StatefulWidget {
  const DesktopCategoryBodyScreen({super.key});

  @override
  State<DesktopCategoryBodyScreen> createState() => _DesktopCategoryBodyScreenState();
}

class _DesktopCategoryBodyScreenState extends State<DesktopCategoryBodyScreen> {
  void _onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  int selectedIndex = 2;
  bool isDark = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CustomDrawerWidget(
            selectedIndex: selectedIndex,
            onItemSelected: _onItemSelected,
          ),
        ),
        Expanded(
          flex: 4,
          child: Center(
            child: Text("Category Desktop"),
          ),
        )
      ],
    );
  }
}
