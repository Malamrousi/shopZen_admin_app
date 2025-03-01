part of 'add_notification_bloc.dart';

@freezed
class AddNotificationEvent with _$AddNotificationEvent {
  const factory AddNotificationEvent.createNotification(
      {required AddNotificationModel addNotificationModel}) = CreateNotificationEvent;
        const factory AddNotificationEvent.deleteNotification(
      {required AddNotificationModel addNotificationModel}) = DeleteNotificationEvent;
}
