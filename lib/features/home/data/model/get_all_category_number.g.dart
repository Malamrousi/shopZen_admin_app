// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_category_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCategoryNumberResponse _$GetAllCategoryNumberResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllCategoryNumberResponse(
      data: json['data'] == null
          ? null
          : GetAllProductNumber.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllCategoryNumberResponseToJson(
        GetAllCategoryNumberResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GetAllProductNumber _$GetAllProductNumberFromJson(Map<String, dynamic> json) =>
    GetAllProductNumber(
      category: (json['categories'] as List<dynamic>?)
          ?.map((e) =>
              GetAllCategoryNumberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllProductNumberToJson(
        GetAllProductNumber instance) =>
    <String, dynamic>{
      'categories': instance.category,
    };

GetAllCategoryNumberModel _$GetAllCategoryNumberModelFromJson(
        Map<String, dynamic> json) =>
    GetAllCategoryNumberModel(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GetAllCategoryNumberModelToJson(
        GetAllCategoryNumberModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
