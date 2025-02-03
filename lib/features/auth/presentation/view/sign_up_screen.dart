import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/desktop_sign_up.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/mobile_sign_up_body.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/tablet_sign_up_body.dart';
import 'package:shopzen_admin_dashboard/responsive_layout.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveLayout(
          mobile: MobileSignUpBody(),
          tablet: TabletSignUpBody(),
          desktop: DesktopSignUp(),
        ),
      ),
    );
  }
}
