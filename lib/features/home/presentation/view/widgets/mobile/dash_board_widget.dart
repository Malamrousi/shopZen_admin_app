import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';

import '../../../../../../core/assets/assets.dart';
import '../custom_container_performance_summary.dart';

class DashBoardWidget extends StatelessWidget {
  const DashBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          
          children: [
            CustomContainerPerformanceSummary(
              number: "50",
              title: "total_users",
              image: Assets.svgTotalUsers,
              isLoading: false,
            ),
            verticalSpacing(10.h),
            CustomContainerPerformanceSummary(
              title: "total_products",
              number: "100",
              image: Assets.svgTotalProduct,
              isLoading: false,
            ),
            verticalSpacing(10.h),
            CustomContainerPerformanceSummary(
              isLoading: false,
              number: "8554",
              title: "total_categories",
              image: Assets.svgTotalCategory,
            ),
            verticalSpacing(10.h),
            CustomContainerPerformanceSummary(
              isLoading: false,
              number: "9515",
              title: "total_sales",
              image: Assets.svgTotalSales,
            ),
          ],
        ),
      ),
    );
  }
}
