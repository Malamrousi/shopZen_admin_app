import 'package:shopzen_admin_dashboard/core/api/api_services.dart';

import '../../../../core/api/Graphql/graphql_queries/get_all_categories_queries.dart';
import '../models/get_all_categories.dart';

class GatAllCategoriesDataSource {
  final ApiService apiService;

  GatAllCategoriesDataSource({required this.apiService});

  Future<GetAllCategoriesResponse> getAllCategories() async {
    final response = await apiService.getAllCategories(GetAllCategoriesQueries().getAllCategories());
    return response;
  }
}
