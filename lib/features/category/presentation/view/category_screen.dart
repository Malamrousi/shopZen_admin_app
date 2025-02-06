import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/features/category/presentation/view/widgets/desktop/desktop_category_screen.dart';
import 'package:shopzen_admin_dashboard/features/category/presentation/view/widgets/mobile/mobile_category_screen.dart';
import 'package:shopzen_admin_dashboard/features/category/presentation/view/widgets/tablet/tablet_category_screen.dart';
import 'package:shopzen_admin_dashboard/responsive_layout.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MobileCategoryScreen(),
      tablet: TabletCategoryScreen(),
      desktop: DesktopCategoryScreen(),
    );
  }
}
