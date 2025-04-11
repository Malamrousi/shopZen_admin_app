import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopzen_admin_dashboard/core/push_notification/firebase_cloud_messaging.dart';
import 'package:shopzen_admin_dashboard/core/utils/app_string.dart';

import '../../../../core/utils/app_ random_value.dart';

class SendNotificationDataSource {
  final notificationId = AppRandomValues.randomStringId;
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

  Future<void> addNotificationToAllUsersFirebase() async {
    final user = FirebaseFirestore.instance.collection(userCollection);
    final userGet = await user.get();
    for(final docs in userGet.docs) {
      await user.doc(docs.id).collection(notificationCollection).doc(notificationId).set({});
    }
  }
}
