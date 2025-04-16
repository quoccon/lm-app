import 'package:json_annotation/json_annotation.dart';

part 'api_model.g.dart';

enum ApiStatus {
  success,
  failed;

  String get code {
    switch (this) {
      case ApiStatus.success:
        return '00';
      default:
        return '';
    }
  }
}

@JsonSerializable()
class ApiModel {
  final String? code;
  final String? message;
  final dynamic data;

  ApiModel({this.code, this.message, this.data});

  String? get error{
    return message;
  }

  factory ApiModel.fromJson(Map<String, dynamic> json) =>
      _$ApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApiModelToJson(this);
}
