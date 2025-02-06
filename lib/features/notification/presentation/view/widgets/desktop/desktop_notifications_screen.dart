import 'package:flutter/material.dart';

import 'desktop_body_notifications.dart';

class DesktopNotificationsScreen extends StatelessWidget {
  const DesktopNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DesktopBodyNotifications(),
    );
  }
}