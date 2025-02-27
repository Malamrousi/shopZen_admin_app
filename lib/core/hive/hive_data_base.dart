import 'package:hive_ce_flutter/adapters.dart';
import 'package:shopzen_admin_dashboard/features/notification/data/model/add_notification_model.dart';

class HiveDataBase {
  HiveDataBase._();
  static final HiveDataBase instance = HiveDataBase._();
  factory HiveDataBase() => instance;
  Box<AddNotificationModel>? notificationBox;
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AddNotificationModelAdapter());
    notificationBox = await Hive.openBox<AddNotificationModel>('notification');
  }
  Future<void> clearBox() async {
    await notificationBox?.clear();
  }
}
