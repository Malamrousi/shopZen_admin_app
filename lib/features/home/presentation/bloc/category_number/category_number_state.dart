part of 'category_number_bloc.dart';

@freezed
class CategoryNumberState with _$CategoryNumberState {
  const factory CategoryNumberState.loading() = Loading;
  const factory CategoryNumberState.success({required String number}) = Success;
  const factory CategoryNumberState.failure({required String message}) = Failure;
}
