import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/widgets/custom_drawer.dart';

import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';

class DesktopBodyNotifications extends StatefulWidget {
  const DesktopBodyNotifications({super.key});

  @override
  State<DesktopBodyNotifications> createState() => _DesktopBodyNotificationsState();
}

class _DesktopBodyNotificationsState extends State<DesktopBodyNotifications> {
  int selectedIndex = 4;

  void _onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

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
            child: Text(
              "إشعارات الإدارة - Desktop",
              style: AppTextStyles.font16Medium(context),
            ),
          ),
        )
      ],
    );
  }
}