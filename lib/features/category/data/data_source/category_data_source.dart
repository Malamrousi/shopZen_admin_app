import 'package:shopzen_admin_dashboard/core/api/api_services.dart';
import 'package:shopzen_admin_dashboard/features/category/data/models/create_category_response.dart';

import '../../../../core/api/Graphql/graphql_queries/categories_queries.dart';
import '../models/create_category_request_body.dart';
import '../models/get_all_categories.dart';

class CategoryDataSource {
  final ApiService apiService;

  CategoryDataSource({required this.apiService});

  Future<GetAllCategoriesResponse> getAllCategories() async {
    final response =
        await apiService.getAllCategories(CategoryQueries().getAllCategories());
    return response;
  }

  Future<CreateCategoryResponse> crateCategory(
      {required CreateCategoryRequestBody body}) async {
    final response = await apiService
        .crateCategory(CategoryQueries().createCategory(createCategory: body));
    return response;
  }
}
