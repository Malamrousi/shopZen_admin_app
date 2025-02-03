import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopzen_admin_dashboard/core/api/api_services.dart';
import 'package:shopzen_admin_dashboard/core/cubit/app_cubit/app_cubit.dart';
import 'package:shopzen_admin_dashboard/core/cubit/upload_image/upload_image_cubit.dart';
import 'package:shopzen_admin_dashboard/core/upload/data_source/upload_image_data_source.dart';
import 'package:shopzen_admin_dashboard/core/upload/repo/upload_image_repo.dart';

import '../api/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {  final navKey = GlobalKey<NavigatorState>();
  final sharedPreferences = await SharedPreferences.getInstance();
    final dio = DioFactory.getDio();

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
 getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // App Preferences Instance

  getIt.registerFactory<AppCubit>(() => AppCubit()); //
  
      //UploadImageDataSource
  getIt.registerSingleton<GlobalKey<NavigatorState>>(navKey);
  getIt.registerLazySingleton<UploadImageDataSource>(
      () => UploadImageDataSource(apiServices: getIt.get<ApiService>()));
      //UploadImageRepo
  getIt.registerLazySingleton<UploadImageRepo>(() => UploadImageRepo(
      uploadImageDataSource: getIt.get<UploadImageDataSource>()));
      //UploadImageCubit
  getIt.registerFactory<UploadImageCubit>(
      () => UploadImageCubit(uploadImageRepo: getIt.get<UploadImageRepo>()));

}
