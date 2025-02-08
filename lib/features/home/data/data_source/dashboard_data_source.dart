import 'package:shopzen_admin_dashboard/core/api/Graphql/graphql_queries/dashboard_queries.dart';

import '../../../../core/api/api_services.dart';
import '../model/get_all_category_number.dart';
import '../model/get_all_product_number.dart';
import '../model/get_all_user_number.dart';

class DashboardDataSource {
    final ApiService apiService;
  DashboardDataSource({
    required this.apiService,
  });


  Future<GetAllUserNumberResponse> numberOfUsers() async {
    final response = await apiService.numberOfUsers(DashboardQueries().getAllUsersNumber());
    return response;
  }


  Future<GetAllProductNumberResponse> numberOfProducts() async {
    final response = await apiService.numberOfProducts(DashboardQueries().getAllProductNumber());
    return response;
  }


  Future<GetAllCategoryNumberResponse> numberOfCategory() async {
    final response = await apiService.numberOfCategory(DashboardQueries().getAllCategoryNumber());
    return response;
  }
}
