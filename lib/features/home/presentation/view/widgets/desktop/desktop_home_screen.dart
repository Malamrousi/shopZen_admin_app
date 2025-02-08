import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/widgets/custom_drawer.dart';
import 'custom_dashboard_widget.dart';

class DesktopHomeScreen extends StatefulWidget {
  const DesktopHomeScreen({super.key});

  @override
  State<DesktopHomeScreen> createState() => _DesktopHomeScreenState();
}

class _DesktopHomeScreenState extends State<DesktopHomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void onItemSelected(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomDrawerWidget(
                  selectedIndex: selectedIndex, onItemSelected: onItemSelected),
            ),
            Expanded(
              flex: 4,
              child: CustomDashboardWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
