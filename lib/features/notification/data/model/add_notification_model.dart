
import 'package:hive_ce/hive.dart';
part 'add_notification_model.g.dart';
@HiveType(typeId: 0)
class AddNotificationModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? body;
  @HiveField(2)
 final DateTime? createAt;
  @HiveField(3)
  String? productId;
  AddNotificationModel({
    this.title,
    this.body,
    this.createAt,
    this.productId,
  });
  
}
