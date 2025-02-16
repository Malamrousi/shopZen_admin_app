import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopzen_admin_dashboard/core/api/api_services.dart';
import 'package:shopzen_admin_dashboard/core/cubit/app_cubit/app_cubit.dart';
import 'package:shopzen_admin_dashboard/core/cubit/upload_image/upload_image_cubit.dart';
import 'package:shopzen_admin_dashboard/core/upload/data_source/upload_image_data_source.dart';
import 'package:shopzen_admin_dashboard/core/upload/repo/upload_image_repo.dart';
import 'package:shopzen_admin_dashboard/features/home/data/data_source/dashboard_data_source.dart';
import 'package:shopzen_admin_dashboard/features/home/data/repo/dashboard_repo.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/bloc/product_number/product_number_bloc.dart';
import 'package:shopzen_admin_dashboard/features/home/presentation/bloc/users_number/user_number_bloc.dart';
import '../../features/auth/data/data_source/auth_data_source.dart';
import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../features/category/data/data_source/gat_all_categories_data_source.dart';
import '../../features/category/data/repo/get_all_categories_repo.dart';
import '../../features/category/presentation/bloc/bloc/get_all_categories_bloc.dart';
import '../../features/home/presentation/bloc/category_number/category_number_bloc.dart';
import '../../features/users/data/data_source/users_data_source.dart';
import '../../features/users/data/repo/users_repo.dart';
import '../../features/users/presentation/bloc/delete_user/delete_users_bloc.dart';
import '../../features/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';
import '../api/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final navKey = GlobalKey<NavigatorState>();
  final sharedPreferences = await SharedPreferences.getInstance();
  final dio = DioFactory.getDio();

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // App Preferences Instance

  getIt.registerFactory<AppCubit>(() => AppCubit()); //

  //UploadImageDataSource
  getIt.registerSingleton<GlobalKey<NavigatorState>>(navKey);
  getIt.registerLazySingleton<UploadImageDataSource>(
    () => UploadImageDataSource(
      apiServices: getIt.get<ApiService>(),
    ),
  );
  //UploadImageRepo
  getIt.registerLazySingleton<UploadImageRepo>(
    () => UploadImageRepo(
      uploadImageDataSource: getIt.get<UploadImageDataSource>(),
    ),
  );
  //UploadImageCubit
  getIt.registerFactory<UploadImageCubit>(
    () => UploadImageCubit(
      uploadImageRepo: getIt.get<UploadImageRepo>(),
    ),
  );

  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSource(
      apiService: getIt.get<ApiService>(),
    ),
  );
  getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepo(authDataSource: getIt.get<AuthDataSource>()));
//LoginBloc
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      repo: getIt.get<AuthRepo>(),
    ),
  );
  //DashboardDataSource
  getIt.registerLazySingleton<DashboardDataSource>(
    () => DashboardDataSource(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //DashboardRepo
  getIt.registerLazySingleton<DashboardRepo>(
    () => DashboardRepo(
      dashboardDataSource: getIt.get<DashboardDataSource>(),
    ),
  );
  //CategoryNumberBloc
  getIt.registerFactory<CategoryNumberBloc>(
    () => CategoryNumberBloc(
      getIt.get<DashboardRepo>(),
    ),
  );
  //ProductNumberBloc
  getIt.registerFactory<ProductNumberBloc>(
    () => ProductNumberBloc(
      getIt.get<DashboardRepo>(),
    ),
  );
  //UserNumberBloc
  getIt.registerFactory<UserNumberBloc>(
    () => UserNumberBloc(
      getIt.get<DashboardRepo>(),
    ),
  );
  //users Data source
  getIt.registerLazySingleton<UsersDataSource>(
    () => UsersDataSource(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //user repo
  getIt.registerLazySingleton<UsersRepo>(
    () => UsersRepo(
      dataSource: getIt.get<UsersDataSource>(),
    ),
  );
  //userBloc
  getIt.registerFactory<GetAllUsersBloc>(
    () => GetAllUsersBloc(
      usersRepo: getIt.get<UsersRepo>(),
    ),
  );

  //deleteUserBloc
  getIt.registerFactory<DeleteUsersBloc>(
    () => DeleteUsersBloc(
      usersRepo: getIt.get<UsersRepo>(),
    ),
  );

  //getAllCategoriesDataSource
  getIt.registerLazySingleton<GatAllCategoriesDataSource>(
    () => GatAllCategoriesDataSource(
      apiService: getIt.get<ApiService>(),
    ),
  );
  //getAllCategoriesRepo
  getIt.registerLazySingleton<GetAllCategoriesRepo>(
    () => GetAllCategoriesRepo(
      gatAllCategoriesDataSource: getIt.get<GatAllCategoriesDataSource>(),
    ),
  );

  //getAllCategoriesBloc
  getIt.registerFactory<GetAllCategoriesBloc>(
    () => GetAllCategoriesBloc(
      getAllCategoriesRepo: getIt.get<GetAllCategoriesRepo>(),
    ),
  );
}
