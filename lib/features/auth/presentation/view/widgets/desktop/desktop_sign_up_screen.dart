import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/desktop/custom_desktop_app_bar.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/desktop/desktop_sign_up_body.dart';

class DesktopSignUpScreen extends StatelessWidget {
  const DesktopSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomDesktopAppBar(),
             verticalSpacing(50),
             DesktopSignUpBody(),
          ],
        ),
      ),
    );
  }
}