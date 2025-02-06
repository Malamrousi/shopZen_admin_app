import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_category_number.g.dart';
@JsonSerializable()
class GetAllCategoryNumberResponse {
  final GetAllProductNumber? data;

  GetAllCategoryNumberResponse({
    this.data,
  });

  factory GetAllCategoryNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoryNumberResponseFromJson(json);

      String get allCategory{
        if(data!.category!.isEmpty){
          return "0";
        }
        return data!.category!.length.toString();
      }
}
@JsonSerializable()
class GetAllProductNumber {
  @JsonKey(name: "categories")
  final List<GetAllCategoryNumberModel>? category;

  GetAllProductNumber({
    this.category,
  });

  factory GetAllProductNumber.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductNumberFromJson(json);
}
@JsonSerializable()
class GetAllCategoryNumberModel {
  final String? name;

  GetAllCategoryNumberModel({
    this.name,
  });

  factory GetAllCategoryNumberModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoryNumberModelFromJson(json);
}
