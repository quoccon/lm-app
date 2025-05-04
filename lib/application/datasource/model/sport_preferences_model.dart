import 'package:flutter_cors/flutter_core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sport_preferences_model.g.dart';
@JsonSerializable()
class SportPreferencesResponse extends Equatable{
  final List<SportPreferences>? response;

  const SportPreferencesResponse({this.response});

  SportPreferencesResponse copyWith({
    List<SportPreferences>? response,
}){
    return SportPreferencesResponse(response: response ?? this.response);
  }

  factory SportPreferencesResponse.fromJson(Map<String, dynamic> json) =>
      _$SportPreferencesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SportPreferencesResponseToJson(this);

  @override
  List<Object?> get props => [response];
}


@JsonSerializable()
class SportPreferences extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'suggets_name')
  final String? suggestName;

  const SportPreferences({this.suggestName, this.id});

  SportPreferences copyWith({String? id,String? suggestName}) {
    return SportPreferences(id: id ?? this.id,suggestName: suggestName ?? this.suggestName);
  }

  factory SportPreferences.fromJson(Map<String, dynamic> json) =>
      _$SportPreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$SportPreferencesToJson(this);

  @override
  List<Object?> get props => [id,suggestName];
}
