import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/desktop_login_screen.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/mobile_login_screen.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/tablet_login_screen.dart';
import 'package:shopzen_admin_dashboard/responsive_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(mobile: MobileLoginScreen(), tablet: TabletLoginScreen(), desktop: DesktopLoginScreen()),
    );
  }
}
