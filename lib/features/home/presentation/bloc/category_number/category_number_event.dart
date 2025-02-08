part of 'category_number_bloc.dart';

@freezed
class CategoryNumberEvent with _$CategoryNumberEvent {
  const factory CategoryNumberEvent.started() = _Started;
  const factory CategoryNumberEvent.getAllCategoryNumber() = GetAllCategoryNumber;
}