// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_user_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUserNumberResponse _$GetAllUserNumberResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllUserNumberResponse(
      getAllUserNumber: json['data'] == null
          ? null
          : GetAllUserNumber.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllUserNumberResponseToJson(
        GetAllUserNumberResponse instance) =>
    <String, dynamic>{
      'data': instance.getAllUserNumber,
    };

GetAllUserNumber _$GetAllUserNumberFromJson(Map<String, dynamic> json) =>
    GetAllUserNumber(
      getAllUserNumberModel: (json['users'] as List<dynamic>?)
          ?.map(
              (e) => GetAllUserNumberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllUserNumberToJson(GetAllUserNumber instance) =>
    <String, dynamic>{
      'users': instance.getAllUserNumberModel,
    };

GetAllUserNumberModel _$GetAllUserNumberModelFromJson(
        Map<String, dynamic> json) =>
    GetAllUserNumberModel(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GetAllUserNumberModelToJson(
        GetAllUserNumberModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
