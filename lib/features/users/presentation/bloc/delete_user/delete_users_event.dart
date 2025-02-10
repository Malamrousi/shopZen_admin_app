part of 'delete_users_bloc.dart';

@freezed
class DeleteUsersEvent with _$DeleteUsersEvent {
  const factory DeleteUsersEvent.started() = _Started;
  const factory DeleteUsersEvent.deleteUser({required String userId}) = RemoveUserEvent;
}