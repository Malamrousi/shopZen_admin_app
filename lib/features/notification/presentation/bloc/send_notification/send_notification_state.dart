part of 'send_notification_bloc.dart';

@freezed
class SendNotificationState with _$SendNotificationState {
  const factory SendNotificationState.initial() = _Initial;
  const factory SendNotificationState.loading({final int? indexId}) = Loading;
  const factory SendNotificationState.success() = Success;
  const factory SendNotificationState.failure({required String message}) = Failure;
}
