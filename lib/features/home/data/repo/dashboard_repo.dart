import 'package:shopzen_admin_dashboard/core/api/api_result.dart';

import 'package:shopzen_admin_dashboard/features/home/data/data_source/dashboard_data_source.dart';
import 'package:shopzen_admin_dashboard/features/home/data/model/get_all_category_number.dart';
import 'package:shopzen_admin_dashboard/features/home/data/model/get_all_product_number.dart';

import '../model/get_all_user_number.dart';

class DashboardRepo {
  final DashboardDataSource dashboardDataSource;
  DashboardRepo({
    required this.dashboardDataSource,
  });

  Future<ApiResult<GetAllUserNumberResponse>> numberOfUsers() async {
    try {
      final response = await dashboardDataSource.numberOfUsers();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<GetAllProductNumberResponse>> numberOfProducts() async {
    try {
      final response = await dashboardDataSource.numberOfProducts();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<GetAllCategoryNumberResponse>> numberOfCategory() async {
    try {
      final response = await dashboardDataSource.numberOfCategory();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
