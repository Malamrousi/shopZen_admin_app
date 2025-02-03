import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/features/auth/presentation/view/widgets/mobile/mobile_login_body.dart';

import '../../../../../../core/helper/spacing.dart';
import '../custom_app_bar.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(),
          verticalSpacing(30.h),
          MobileLoginBody(),
        ],
      ),
    );
  }
}
