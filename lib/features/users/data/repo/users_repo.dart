// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shopzen_admin_dashboard/core/api/api_result.dart';

import '../data_source/users_data_source.dart';
import '../model/get_all_user_model.dart';

class UsersRepo {
  final UsersDataSource dataSource;
  UsersRepo({
    required this.dataSource,
  });


 Future<ApiResult<GetAllUserResponse>> getAllUsers() async {
  try {
    final response = await dataSource.getAllUsers();
    return ApiResult.success(response);
  } catch (error) {
    return ApiResult.failure(error.toString());
  }
 }
  
}
