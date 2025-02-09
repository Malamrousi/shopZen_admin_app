part of 'get_all_users_bloc.dart';

@freezed
class GetAllUsersState with _$GetAllUsersState {
  const factory GetAllUsersState.loading() = Loading;
  const factory GetAllUsersState.empty() = Empty;
  const factory GetAllUsersState.success({required List<GetAllUserModel> users}) = Success;
  const factory GetAllUsersState.search({required List<GetAllUserModel> users}) = Search;
  const factory GetAllUsersState.failure({required String message}) = Failure;
}
