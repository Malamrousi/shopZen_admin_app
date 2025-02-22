import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_category_response.g.dart';
@JsonSerializable()
class CreateCategoryResponse {
  final CreateCategory? data;
  CreateCategoryResponse({this.data});

 Map<String, dynamic> toJson() => _$CreateCategoryResponseToJson(this);

   factory CreateCategoryResponse.fromJson(Map<String, dynamic> json) => _$CreateCategoryResponseFromJson(json);

}

@JsonSerializable()
class CreateCategory {
  @JsonKey(name: 'addCategory')
  final CreateCategoryModel categories;
  CreateCategory({required this.categories});
  factory CreateCategory.fromJson(Map<String, dynamic> json) => _$CreateCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CreateCategoryToJson(this);

}

@JsonSerializable()
class CreateCategoryModel {
  final String? id;
  final String? name;
  final String? image;


  CreateCategoryModel({this.id, this.name, this.image,});
 factory CreateCategoryModel.fromJson(Map<String, dynamic> json) => _$CreateCategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateCategoryModelToJson(this);
}
