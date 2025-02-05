import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/helper/theme_extension.dart';
import 'package:shopzen_admin_dashboard/core/shared_pref/shared_prefs_key.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/view/widgets/mobile/mobile_side_bar.dart';
import '../../../../../../core/app/app_localizations.dart';
import '../../../../../../core/shared_pref/shared_pref.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  // Define your pages as actual widget pages instead of containers
  List<Widget> pages = [
    Container(
        color: Colors.pinkAccent, child: Center(child: Text("dashboard"))),
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
      child:
          Center(child: Text("Logout", style: TextStyle(color: Colors.white))),
    ),
  ];
  @override
  void initState() {
    super.initState();
  }

  int selectedIndex = 0;
  bool isSideBarOpen = false;

  void toggleSideBar() {
    setState(() {
      isSideBarOpen = !isSideBarOpen;
    });
  }

  void closeSideBar() {
    setState(() {
      isSideBarOpen = false;
    });
  }

  void handlePageSelection(int index) {
    if (index == pages.length) {
      return;
    }

    setState(() {
      selectedIndex = index;
    });
    closeSideBar();
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = SharedPref().getString(PrefKeys.language) ?? ARABIC;
    final isRTL = isArabic == ARABIC;

    return Stack(
      
      children: [
        Column(
          children: [
            Align(
              alignment: isRTL ? Alignment.centerRight : Alignment.centerLeft,
              child: IconButton(
                onPressed: toggleSideBar,
                icon: Icon(
                  Icons.menu,
                  color: context.colorThemeExtension.mainColor,
                ),
              ),
            ),
            Expanded(
              child: pages[selectedIndex],
            ),
          ],
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          right: isRTL ? (isSideBarOpen ? 0 : -250) : null,
          left: !isRTL ? (isSideBarOpen ? 0 : -250) : null,
          top: 0,
          bottom: 0,
          child: MobileSideBar(
            selectedIndex: selectedIndex,
            onItemSelected: handlePageSelection,
            onClose: closeSideBar,
          ),
        ),
        if (isSideBarOpen)
          Positioned.fill(
            child: GestureDetector(
              onTap: closeSideBar,
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
      ],
    );
  }
}
