import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/custom_app_bar.dart';

import 'tablet_login_body.dart';

class TabletLoginScreen extends StatelessWidget {
  const TabletLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          verticalSpacing(30),
          TabletLoginBody(),
          
        ],
      ),
    );
  }
}
