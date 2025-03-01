import 'package:shopzen_admin_dashboard/core/push_notification/firebase_cloud_messaging.dart';

class SendNotificationDataSource {
  Future<void> sendNotification(
      {required String title,
      required String body,
      required int? productId}) async {
    final response = await FirebaseCloudMessaging.sendPushNotification(
      title: title,
      body: body,
      productId: productId!,
    );
    return response;
  }
}
