import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/view/widgets/desktop/desktop_home_screen.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/view/widgets/mobile/mobile_home_screen.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/view/widgets/tablet/tablet_home_screen.dart';
import 'package:shopzen_admin_dashboard/responsive_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ResponsiveLayout(
          mobile: MobileHomeScreen(),
          tablet: TabletHomeScreen(),
          desktop: DesktopHomeScreen(),
        ),
      ),
    );
  }
}
