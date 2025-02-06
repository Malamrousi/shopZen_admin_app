part of 'user_number_bloc.dart';

@freezed
class UserNumberState with _$UserNumberState {
  const factory UserNumberState.loading() = Loading;
  const factory UserNumberState.success({required String userNumber}) = Success;
  const factory UserNumberState.failure({required String message}) = Failure;}
