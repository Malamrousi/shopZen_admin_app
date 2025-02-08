
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_product_number.g.dart';

@JsonSerializable()
class GetAllProductNumberResponse {
  final GetAllProductNumber? data;
  
  GetAllProductNumberResponse({
    required this.data,
  });

  factory GetAllProductNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductNumberResponseFromJson(json);

  String get getProductNumber {
    return data?.productList?.length.toString() ?? "0";
  }
}

@JsonSerializable()
class GetAllProductNumber {
  @JsonKey(name: "products") 
  final List<GetAllProductNumberModel>? productList;
  
  GetAllProductNumber({
    required this.productList,
  });

  factory GetAllProductNumber.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductNumberFromJson(json);
}

@JsonSerializable()
class GetAllProductNumberModel {
  final String? title;
  
  GetAllProductNumberModel({
    this.title,
  });

  factory GetAllProductNumberModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductNumberModelFromJson(json);
}