import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/desktop/desktop_sign_up_screen.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/mobile/mobile_sign_up_screen.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/tablet/tablet_sign_up_screen.dart';
import 'package:shopzen_admin_dashboard/responsive_layout.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveLayout(
          mobile: MobileSignUpScreen(),
          tablet: TabletSignUpScreen(),
          desktop: DesktopSignUpScreen(),
        ),
      ),
    );
  }
}
