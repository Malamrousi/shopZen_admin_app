import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/features/notification/presentation/view/widgets/desktop/desktop_notifications_screen.dart';
import 'package:shopzen_admin_dashboard/features/notification/presentation/view/widgets/mobile/mobile_notifications_screen.dart';
import 'package:shopzen_admin_dashboard/features/notification/presentation/view/widgets/tablet/tablet_notifications_screen.dart';
import 'package:shopzen_admin_dashboard/responsive_layout.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MobileNotificationsScreen(),
      tablet: TabletNotificationsScreen(),
      desktop: DesktopNotificationsScreen(),
    );
  }
}
