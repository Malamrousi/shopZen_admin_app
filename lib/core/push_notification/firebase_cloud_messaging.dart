import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseCloudMessaging {
  FirebaseCloudMessaging._();
  static final FirebaseCloudMessaging instance = FirebaseCloudMessaging._();
  factory FirebaseCloudMessaging() => instance;
  final fcm = FirebaseMessaging.instance;
  static final String url = dotenv.env['FCM_URL'] ?? '';
  static final String? accessToken = dotenv.env['FCM_ACCESS_TOKEN'];
  static final String topic = dotenv.env['TOPIC'] ?? '';
  static Future<void> sendPushNotification(
      {required String title,
      required String body,
      required int productId}) async {
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
            "topic": topic,
            "notification": {"title": title, "body": body, },
          }
        },
      );

      log("Notification Response => ${response.data}");
    } catch (e) {
      debugPrint("Error sending FCM notification: $e");
    }
  }
}
