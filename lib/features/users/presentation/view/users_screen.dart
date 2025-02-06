import 'package:flutter/material.dart';

import '../../../../responsive_layout.dart';
import 'widgets/desktop/desktop_users_screen.dart';
import 'widgets/mobile/mobile_users_screen.dart';
import 'widgets/tablet/tablet_users_screen.dart';


class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MobileUsersScreen(),
      tablet: TabletUsersScreen(),
      desktop: DesktopUsersScreen(),
    );
  }
}
