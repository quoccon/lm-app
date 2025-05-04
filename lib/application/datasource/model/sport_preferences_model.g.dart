// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_preferences_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SportPreferencesResponse _$SportPreferencesResponseFromJson(
  Map<String, dynamic> json,
) => SportPreferencesResponse(
  response:
      (json['response'] as List<dynamic>?)
          ?.map((e) => SportPreferences.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SportPreferencesResponseToJson(
  SportPreferencesResponse instance,
) => <String, dynamic>{'response': instance.response};

SportPreferences _$SportPreferencesFromJson(Map<String, dynamic> json) =>
    SportPreferences(
      suggestName: json['suggets_name'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$SportPreferencesToJson(SportPreferences instance) =>
    <String, dynamic>{'_id': instance.id, 'suggets_name': instance.suggestName};
