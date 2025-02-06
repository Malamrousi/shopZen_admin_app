import 'package:flutter/material.dart';

import 'desktop_body_settings.dart';

class DesktopSettingsScreen extends StatelessWidget {
  const DesktopSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DesktopBodySettings(),
    );
  }
}
