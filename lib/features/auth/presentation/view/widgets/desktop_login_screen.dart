import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/custom_desktop_app_bar.dart';

import '../../../../../core/helper/spacing.dart';
import 'desktop_login_body.dart';

class DesktopLoginScreen extends StatelessWidget {
  const DesktopLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CustomDesktopAppBar(),
            verticalSpacing(50),
            DesktopLoginBody()
            
          ],
        ),
      ),
    );
  }
}
