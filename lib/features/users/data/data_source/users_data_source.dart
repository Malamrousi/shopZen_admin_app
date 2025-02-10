// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shopzen_admin_dashboard/core/api/Graphql/graphql_queries/users_queries.dart';

import '../../../../core/api/api_services.dart';
import '../model/get_all_user_model.dart';

class UsersDataSource {
  final ApiService apiService;
  UsersDataSource({
    required this.apiService,
  });

  Future<GetAllUserResponse> getAllUsers() async {
    final response = await apiService.getAllUsers(UsersQueries().getAllUsers());
    return response;
  }

  Future<void> deleteUser({required String userId}) async {
    await apiService.deleteUser(UsersQueries().deleteUser(userId: userId));
  }
}
