import 'package:dio/dio.dart';
import 'package:shopzen_admin_dashboard/core/api/api_services.dart';
import 'package:shopzen_admin_dashboard/core/upload/model/upload_image_response.dart';

import 'dart:typed_data';

class UploadImageDataSource {
  final ApiService apiServices;
  UploadImageDataSource({required this.apiServices});

  Future<UploadImageResponse> uploadImage({required Uint8List file}) async {
    final formData = FormData();

    formData.files.add(
      MapEntry(
        "file",
        MultipartFile.fromBytes(
          file, 
          filename: "shopImage", 
        ),
      ),
    );

    final response = await apiServices.uploadImage(formData);
    return response;
  }
}
