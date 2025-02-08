import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/features/product/presentation/view/widgets/desktop/desktop_body_product.dart';

class DesktopProductScreen extends StatelessWidget {
  const DesktopProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DesktopBodyProduct(),
    );
  }
}