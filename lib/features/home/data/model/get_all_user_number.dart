// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_user_number.g.dart';

@JsonSerializable()
class GetAllUserNumberResponse {
  @JsonKey(name: "data")
  final GetAllUserNumber? getAllUserNumber;
  GetAllUserNumberResponse({
    this.getAllUserNumber,
  });

  factory GetAllUserNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllUserNumberResponseFromJson(json);

  String get allUser {
    if (getAllUserNumber!.getAllUserNumberModel!.isEmpty) {
      return "0";
    }

    return getAllUserNumber!.getAllUserNumberModel!.length.toString();
  }
}

@JsonSerializable()
class GetAllUserNumber {
  @JsonKey(name: "users")
  final List<GetAllUserNumberModel>? getAllUserNumberModel;
  GetAllUserNumber({
    this.getAllUserNumberModel,
  });

  factory GetAllUserNumber.fromJson(Map<String, dynamic> json) =>
      _$GetAllUserNumberFromJson(json);
}

@JsonSerializable()
class GetAllUserNumberModel {
  final String? name;
  GetAllUserNumberModel({
    this.name,
  });

  factory GetAllUserNumberModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllUserNumberModelFromJson(json);
}
