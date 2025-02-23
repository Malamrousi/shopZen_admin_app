import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseCloudMessaging {
  FirebaseCloudMessaging._();
  static final FirebaseCloudMessaging instance = FirebaseCloudMessaging._();
  factory FirebaseCloudMessaging() => instance;

  static Future<void> sendPushNotification({
    required String title,
    required String body,
  }) async {
    final String? url = dotenv.env['FCM_URL'];
    final String? accessToken = dotenv.env['FCM_ACCESS_TOKEN'];

    if (url == null) {
      log("FCM_URL is missing");
      return;
    } else if (accessToken == null) {
      log("FCM_ACCESS_TOKEN is missing");
      return;
    }

    try {
      final response = await Dio().post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken',
          },
        ),
        data: {
          "message": {
            "token":
                "dhrYhQqqTca1Bt1LLsS3Z4:APA91bErV6QX_yGSO2tpzUZlXi9lxYvDx2DvpJ2lDB_72eCAaFONUGheWZBKCQF5Q_S53UCspWjz7xinLPxce7v--Z_PEEp_kALMSEuQtKxFuLgK1fPyDgA",
            "notification": {
              "title": title,
              "body": body,
            },
          }
        },
      );

      log("Notification Response => ${response.data}");
    } catch (e) {
      debugPrint("Error sending FCM notification: $e");
    }
  }
}
