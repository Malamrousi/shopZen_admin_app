import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/helper/spacing.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/bloc/product_number/product_number_bloc.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/bloc/users_number/user_number_bloc.dart';

import '../../../../../../core/assets/assets.dart';
import '../../../bloc/category_number/category_number_bloc.dart';
import '../custom_container_performance_summary.dart';

class DashBoardWidget extends StatelessWidget {
  const DashBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<UserNumberBloc>().add(
              const UserNumberEvent.getUsers(),
            );
        context.read<ProductNumberBloc>().add(
              const ProductNumberEvent.getProductNumber(),
            );
        context.read<CategoryNumberBloc>().add(
              const CategoryNumberEvent.getAllCategoryNumber(),
            );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          children: [
            BlocBuilder<UserNumberBloc, UserNumberState>(
              builder: (context, state) {
                return state.when(loading: () {
                  return CustomContainerPerformanceSummary(
                    number: "50",
                    title: "total_users",
                    image: Assets.svgTotalUsers,
                    isLoading: true,
                  );
                }, success: (productNumber) {
                  return CustomContainerPerformanceSummary(
                    number: productNumber,
                    title: "total_users",
                    image: Assets.svgTotalUsers,
                    isLoading: false,
                  );
                }, failure: (message) {
                  return CustomContainerPerformanceSummary(
                    number: "error".tr(context),
                    title: "total_users",
                    image: Assets.svgTotalUsers,
                    isLoading: false,
                  );
                });
              },
            ),
            verticalSpacing(10.h),
            BlocBuilder<ProductNumberBloc, ProductNumberState>(
              builder: (context, state) {
                return state.when(loading: () {
                  return CustomContainerPerformanceSummary(
                    title: "total_products",
                    number: "",
                    image: Assets.svgTotalProduct,
                    isLoading: true,
                  );
                }, success: (productNumber) {
                  return CustomContainerPerformanceSummary(
                    title: "total_products",
                    number: productNumber,
                    image: Assets.svgTotalProduct,
                    isLoading: false,
                  );
                }, failure: (message) {
                  return CustomContainerPerformanceSummary(
                    title: "total_products",
                    number: "error".tr(context),
                    image: Assets.svgTotalProduct,
                    isLoading: false,
                  );
                });
              },
            ),
            verticalSpacing(10.h),
            BlocBuilder<CategoryNumberBloc, CategoryNumberState>(
              builder: (context, state) {
                return state.when(loading: () {
                  return CustomContainerPerformanceSummary(
                    isLoading: true,
                    number: "8554",
                    title: "total_categories",
                    image: Assets.svgTotalCategory,
                  );
                }, success: (categoryNumber) {
                  return CustomContainerPerformanceSummary(
                    isLoading: false,
                    number: categoryNumber,
                    title: "total_categories",
                    image: Assets.svgTotalCategory,
                  );
                }, failure: (message) {
                  return CustomContainerPerformanceSummary(
                    isLoading: false,
                    number: "error".tr(context),
                    title: "total_categories",
                    image: Assets.svgTotalCategory,
                  );
                });
              },
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
