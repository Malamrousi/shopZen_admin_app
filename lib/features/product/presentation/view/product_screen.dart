import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/features/product/presentation/view/widgets/desktop/desktop_product_screen.dart';
import 'package:shopzen_admin_dashboard/features/product/presentation/view/widgets/mobile/mobile_product_screen%20.dart';
import 'package:shopzen_admin_dashboard/features/product/presentation/view/widgets/tablet/tablet_product_screen.dart';
import 'package:shopzen_admin_dashboard/responsive_layout.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MobileProductScreen(),
      tablet: TabletProductScreen(),
      desktop: DesktopProductScreen(),
    );
  }
}
