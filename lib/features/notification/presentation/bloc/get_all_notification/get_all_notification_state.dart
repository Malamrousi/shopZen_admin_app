part of 'get_all_notification_bloc.dart';

@freezed
class GetAllNotificationState with _$GetAllNotificationState {
  const factory GetAllNotificationState.loading() = Loading;
  const factory GetAllNotificationState.failure({required String message}) =
      Failure;
  const factory GetAllNotificationState.success(
      {required List<AddNotificationModel> notificationsList}) = Success;
  const factory GetAllNotificationState.empty() = Empty;
}
