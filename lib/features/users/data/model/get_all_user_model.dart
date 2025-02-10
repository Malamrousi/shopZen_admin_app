// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_user_model.g.dart';

@JsonSerializable()
class GetAllUserResponse {
  final GetAllUser? data;

  GetAllUserResponse({
    required this.data,
  });

  factory GetAllUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllUserResponseFromJson(json);
}

@JsonSerializable()
class GetAllUser {
  @JsonKey(name: "users")
  final List<GetAllUserModel>? users;

  GetAllUser({
    required this.users,
  });

  factory GetAllUser.fromJson(Map<String, dynamic> json) =>
      _$GetAllUserFromJson(json);
}

@JsonSerializable()
class GetAllUserModel {
  final String? name;
  final String? email;
  final String? id;
  @JsonKey(name: "avatar")
  final String? image;
  GetAllUserModel(this.id, {
    required this.name,
    required this.email,
    required this.image,
  });

  factory GetAllUserModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllUserModelFromJson(json);
}
