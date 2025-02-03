import 'package:flutter/material.dart';
import 'package:shopzen_admin_dashboard/core/api/api_result.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/di/di.dart';
import 'package:shopzen_admin_dashboard/core/upload/data_source/upload_image_data_source.dart';
import 'package:shopzen_admin_dashboard/core/upload/model/upload_image_response.dart';
import 'dart:typed_data';

class UploadImageRepo {
  final UploadImageDataSource uploadImageDataSource;

  UploadImageRepo({required this.uploadImageDataSource});

  Future<ApiResult<UploadImageResponse>> uploadImage(
      {required Uint8List file}) async {
    try {
      final response = await uploadImageDataSource.uploadImage(file: file);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure("please_try_again_we_have_error".tr(
          getIt.get<GlobalKey<NavigatorState>>().currentState!.context, ));
    }
  }
}
