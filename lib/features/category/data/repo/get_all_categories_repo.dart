import 'package:shopzen_admin_dashboard/core/api/api_result.dart';

import '../data_source/gat_all_categories_data_source.dart';
import '../models/get_all_categories.dart';

class GetAllCategoriesRepo {
  final GatAllCategoriesDataSource gatAllCategoriesDataSource;

  GetAllCategoriesRepo({required this.gatAllCategoriesDataSource});

  Future<ApiResult<GetAllCategoriesResponse>> getAllCategories() async {
    try {
      final response = await gatAllCategoriesDataSource.getAllCategories();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
