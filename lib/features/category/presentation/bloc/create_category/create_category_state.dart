part of 'create_category_bloc.dart';

@freezed
class CreateCategoryState with _$CreateCategoryState {
  const factory CreateCategoryState.initial() = _Initial;
  const factory CreateCategoryState.loading() = LoadingState;
  const factory CreateCategoryState.failure({required String failureMessage}) =
      FailureState;
  const factory CreateCategoryState.success() = SuccessState;
}
