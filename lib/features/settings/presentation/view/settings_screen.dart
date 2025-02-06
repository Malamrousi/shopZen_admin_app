import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/responsive_layout.dart';
import 'widgets/desktop/desktop_settings_screen.dart';
import 'widgets/mobile/mobile_settings_screen.dart';
import 'widgets/tablet/tablet_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MobileSettingsScreen(),
      tablet: TabletSettingsScreen(),
      desktop: DesktopSettingsScreen(),
    );
  }
}
