// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_product_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProductNumberResponse _$GetAllProductNumberResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllProductNumberResponse(
      data: json['data'] == null
          ? null
          : GetAllProductNumber.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllProductNumberResponseToJson(
        GetAllProductNumberResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GetAllProductNumber _$GetAllProductNumberFromJson(Map<String, dynamic> json) =>
    GetAllProductNumber(
      productList: (json['products'] as List<dynamic>?)
          ?.map((e) =>
              GetAllProductNumberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllProductNumberToJson(
        GetAllProductNumber instance) =>
    <String, dynamic>{
      'products': instance.productList,
    };

GetAllProductNumberModel _$GetAllProductNumberModelFromJson(
        Map<String, dynamic> json) =>
    GetAllProductNumberModel(
      title: json['title'] as String?,
    );

Map<String, dynamic> _$GetAllProductNumberModelToJson(
        GetAllProductNumberModel instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
