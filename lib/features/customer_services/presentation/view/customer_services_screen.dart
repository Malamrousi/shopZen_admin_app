import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/features/customer_services/presentation/view/widgets/desktop/desktop_customer_services.dart';
import 'package:shopzen_admin_dashboard/features/customer_services/presentation/view/widgets/mobile/mobile_customer_services_screen.dart';
import 'package:shopzen_admin_dashboard/features/customer_services/presentation/view/widgets/tablet/tablet_customer_services_screen.dart';
import 'package:shopzen_admin_dashboard/responsive_layout.dart';

class CustomerServicesScreen extends StatelessWidget {
  const CustomerServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MobileCustomerServicesScreen(),
      tablet: TabletCustomerServicesScreen(),
      desktop: DesktopCustomerServices(),
    );
  }
}
