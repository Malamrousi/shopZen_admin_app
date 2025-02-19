import 'package:shopzen_admin_dashboard/core/api/api_result.dart';
import 'package:shopzen_admin_dashboard/features/category/data/models/create_category_response.dart';

import '../data_source/category_data_source.dart';
import '../models/create_category_request_body.dart';
import '../models/get_all_categories.dart';

class GetAllCategoriesRepo {
  final CategoryDataSource categoryDataSource;

  GetAllCategoriesRepo({required this.categoryDataSource});

  Future<ApiResult<GetAllCategoriesResponse>> getAllCategories() async {
    try {
      final response = await categoryDataSource.getAllCategories();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
    Future<ApiResult<CreateCategoryResponse>> crateCategory({required CreateCategoryRequestBody category}) async {
    try {
      final response = await categoryDataSource.crateCategory(body: category);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
