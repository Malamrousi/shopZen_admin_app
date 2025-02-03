import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/custom_app_bar.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/tablet/tablet_sign_up_body.dart';

class TabletSignUp extends StatelessWidget {
  const TabletSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            verticalSpacing(30),
            TabletSignUpBody()
          ],
        ),
      ),
    );
  }
}
