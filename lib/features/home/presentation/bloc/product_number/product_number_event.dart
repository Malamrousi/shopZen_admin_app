part of 'product_number_bloc.dart';

@freezed
class ProductNumberEvent with _$ProductNumberEvent {
  const factory ProductNumberEvent.started() = _Started;
  const factory ProductNumberEvent.getProductNumber() = GetProductNumberEvent;
}