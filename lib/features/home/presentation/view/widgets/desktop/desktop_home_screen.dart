import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/view/widgets/desktop/admin_side_bar.dart';
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
    List<Widget> pages = [
  CustomDashboardWidget(),
  Container(color: Colors.red, child: Center(child: Text("Products"))),
  Container(color: Colors.orange, child: Center(child: Text("Categories"))),
  Container(color: Colors.purple, child: Center(child: Text("Users"))),
  Container(color: Colors.yellow, child: Center(child: Text("Notifications"))),
  Container(color: Colors.cyan, child: Center(child: Text("Settings"))),
  Container(color: Colors.teal, child: Center(child: Text("Customer Service"))),
  Container(
      color: Colors.black,
      child:
          Center(child: Text("Logout", style: TextStyle(color: Colors.white)))),
];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: AdminSideBar(
                selectedIndex: selectedIndex,
                onItemSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: pages[selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}
