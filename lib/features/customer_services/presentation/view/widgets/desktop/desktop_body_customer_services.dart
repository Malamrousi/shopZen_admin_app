import 'package:flutter/material.dart';

import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../../core/widgets/custom_drawer.dart';

class DesktopBodyCustomerServices extends StatefulWidget {
  const DesktopBodyCustomerServices({super.key});

  @override
  State<DesktopBodyCustomerServices> createState() => _DesktopBodyCustomerServicesState();
}

class _DesktopBodyCustomerServicesState extends State<DesktopBodyCustomerServices> {
      void _onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
    int selectedIndex = 6;
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