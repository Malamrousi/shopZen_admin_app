// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCategoryResponse _$CreateCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    CreateCategoryResponse(
      data: json['data'] == null
          ? null
          : CreateCategory.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCategoryResponseToJson(
        CreateCategoryResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CreateCategory _$CreateCategoryFromJson(Map<String, dynamic> json) =>
    CreateCategory(
      categories: CreateCategoryModel.fromJson(
          json['addCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCategoryToJson(CreateCategory instance) =>
    <String, dynamic>{
      'addCategory': instance.categories,
    };

CreateCategoryModel _$CreateCategoryModelFromJson(Map<String, dynamic> json) =>
    CreateCategoryModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CreateCategoryModelToJson(
        CreateCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
