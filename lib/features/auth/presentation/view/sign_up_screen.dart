import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/desktop/desktop_sign_up.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/mobile/mobile_sign_up_body.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/tablet/tablet_sign_up.dart';
import 'package:shopzen_admin_dashboard/responsive_layout.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveLayout(
          mobile: MobileSignUpBody(),
          tablet: TabletSignUp(),
          desktop: DesktopSignUp(),
        ),
      ),
    );
  }
}
