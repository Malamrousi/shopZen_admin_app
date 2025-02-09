// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUserResponse _$GetAllUserResponseFromJson(Map<String, dynamic> json) =>
    GetAllUserResponse(
      data: json['data'] == null
          ? null
          : GetAllUser.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllUserResponseToJson(GetAllUserResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GetAllUser _$GetAllUserFromJson(Map<String, dynamic> json) => GetAllUser(
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => GetAllUserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllUserToJson(GetAllUser instance) =>
    <String, dynamic>{
      'users': instance.users,
    };

GetAllUserModel _$GetAllUserModelFromJson(Map<String, dynamic> json) =>
    GetAllUserModel(
      json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      image: json['avatar'] as String?,
    );

Map<String, dynamic> _$GetAllUserModelToJson(GetAllUserModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'id': instance.id,
      'avatar': instance.image,
    };
