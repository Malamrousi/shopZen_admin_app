part of 'user_number_bloc.dart';

@freezed
class UserNumberEvent with _$UserNumberEvent {
  const factory UserNumberEvent.started() = _Started;
  const factory UserNumberEvent.getUsers() = GetUsers;
}