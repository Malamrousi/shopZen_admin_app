import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/assets/assets.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/view/widgets/desktop/custom_container_performance_summary.dart';

class PerformanceSummary extends StatelessWidget {
  const PerformanceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            CustomContainerPerformanceSummary(
              title: "total_users",
              image: Assets.svgTotalUsers,
            ),
            horizontalSpacing(30),
            CustomContainerPerformanceSummary(
              title: "total_products",
              image: Assets.svgTotalProduct,
            ),
            horizontalSpacing(30),
            CustomContainerPerformanceSummary(
              title: "total_categories",
              image: Assets.svgTotalCategory,
            ),
            horizontalSpacing(30),
            CustomContainerPerformanceSummary(
              title: "total_sales",
              image: Assets.svgTotalSales,
            ),
          ],
        ),
      ],
    );
  }
}
