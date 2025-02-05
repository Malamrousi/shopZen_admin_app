import 'package:flutter/material.dart';

import 'dash_board_widget.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      DashBoardWidget(),
      Container(color: Colors.red, child: Center(child: Text("Products"))),
      Container(color: Colors.orange, child: Center(child: Text("Categories"))),
      Container(color: Colors.purple, child: Center(child: Text("Users"))),
      Container(
          color: Colors.yellow, child: Center(child: Text("Notifications"))),
      Container(color: Colors.cyan, child: Center(child: Text("Settings"))),
      Container(
          color: Colors.teal, child: Center(child: Text("Customer Service"))),
      Container(
          color: Colors.black,
          child: Center(
              child: Text("Logout", style: TextStyle(color: Colors.white)))),
    ];

    return pages[selectedIndex];
  }
}
