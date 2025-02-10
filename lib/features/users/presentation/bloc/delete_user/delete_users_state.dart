part of 'delete_users_bloc.dart';

@freezed
class DeleteUsersState with _$DeleteUsersState {
  const factory DeleteUsersState.initial() = _Initial;
  const factory DeleteUsersState.loading({required String userId}) = Loading;
  const factory DeleteUsersState.success() = Sucecss;
  const factory DeleteUsersState.failure({required String message}) = Failure;
}
