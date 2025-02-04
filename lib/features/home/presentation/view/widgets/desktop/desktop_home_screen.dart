import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/view/widgets/desktop/admin_side_bar.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: AdminSideBar()
          ),
          Expanded(
            flex:4,
            child: Container(
              color: Colors.green,
            ),
      )]),
    );
  }
}