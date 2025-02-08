import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:shopzen_admin_dashboard/core/upload/model/upload_image_response.dart';
import 'package:shopzen_admin_dashboard/features/auth/data/models/login_response_model.dart';
import 'package:shopzen_admin_dashboard/features/auth/data/models/sign_up_response_model.dart';
import 'package:shopzen_admin_dashboard/features/auth/data/models/user_role_model.dart';
import 'package:shopzen_admin_dashboard/features/home/data/model/get_all_category_number.dart';
import 'package:shopzen_admin_dashboard/features/home/data/model/get_all_product_number.dart';

import '../../features/home/data/model/get_all_user_number.dart';


part 'api_services.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphql = '/graphql';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(graphql)
  Future<LoginResponseModel> login(
    @Body() Map<String, dynamic> getUser,
  );

  @GET("/api/v1/auth/profile")
  Future<UserRoleModel> userRole();

  @POST("/api/v1/files/upload")
  Future<UploadImageResponse> uploadImage(
    @Body() FormData? file,
  );

  @POST(graphql)
  Future<SignUpResponseModel> signup(
    @Body() Map<String, dynamic> creteUser,
  );

   @POST(graphql)
  Future<GetAllProductNumberResponse> numberOfProducts(
    @Body() Map<String, dynamic> query,
  );

     @POST(graphql)
  Future<GetAllCategoryNumberResponse> numberOfCategory(
    @Body() Map<String, dynamic> query,
  );
     @POST(graphql)
  Future<GetAllUserNumberResponse> numberOfUsers(
    @Body() Map<String, dynamic> query,
  );
}
