

import 'package:flutter/material.dart';

import '../../../../../../core/shared_pref/shared_pref.dart';
import '../../../../../../core/shared_pref/shared_prefs_key.dart';
import '../../../../../../core/utils/styles/app_text_styles.dart';
import '../../../../../../core/widgets/custom_drawer.dart';

class DesktopBodyUsers extends StatefulWidget {
  const DesktopBodyUsers({super.key});

  @override
  State<DesktopBodyUsers> createState() => _DesktopBodyUsersState();
}

class _DesktopBodyUsersState extends State<DesktopBodyUsers> {
  int selectedIndex = 3; // 🆕 تأكد من أن رقم المستخدمين هو نفس موقعه في القائمة الجانبية

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
              "إدارة المستخدمين - Desktop",
              style: AppTextStyles.font16Medium(context),
            ),
          ),
        )
      ],
    );
  }
}