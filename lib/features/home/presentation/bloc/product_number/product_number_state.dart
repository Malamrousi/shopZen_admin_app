part of 'product_number_bloc.dart';

@freezed
class ProductNumberState with _$ProductNumberState {
  const factory ProductNumberState.loading() = Loading;
  const factory ProductNumberState.success({required String productNumber}) = Success;
  const factory ProductNumberState.failure({
    required String message,
  }) = Failure;
}
