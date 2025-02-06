import 'package:flutter/material.dart';

import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';
import '../../../../../../core/widgets/custom_drawer.dart';

class DesktopBodySettings extends StatefulWidget {
  const DesktopBodySettings({super.key});

  @override
  State<DesktopBodySettings> createState() => _DesktopBodySettingsState();
}

class _DesktopBodySettingsState extends State<DesktopBodySettings> {
  int selectedIndex = 5; 

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
              "إعدادات النظام - Desktop",
              style: AppTextStyles.font16Medium(context),
            ),
          ),
        )
      ],
    );
  }
}