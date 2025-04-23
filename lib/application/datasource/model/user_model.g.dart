// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
  token:
      json['token'] == null
          ? null
          : TokenModel.fromJson(json['token'] as Map<String, dynamic>),
  user:
      json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{'token': instance.token, 'user': instance.user};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  username: json['username'] as String?,
  email: json['email'] as String?,
  avatar: json['avatar'] as String?,
  gender: json['gender'] as String?,
  isVerifyToken: json['isVerifyToken'] as bool?,
  sportPreferences:
      json['sport_preferences'] == null
          ? null
          : SportPreferences.fromJson(
            json['sport_preferences'] as Map<String, dynamic>,
          ),
  createAtText: json['created_at_text'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'username': instance.username,
  'email': instance.email,
  'avatar': instance.avatar,
  'gender': instance.gender,
  'isVerifyToken': instance.isVerifyToken,
  'sport_preferences': instance.sportPreferences,
  'created_at_text': instance.createAtText,
};

SportPreferences _$SportPreferencesFromJson(Map<String, dynamic> json) =>
    SportPreferences(
      suggestName: json['suggets_name'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$SportPreferencesToJson(SportPreferences instance) =>
    <String, dynamic>{'_id': instance.id, 'suggets_name': instance.suggestName};

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) =>
    TokenModel(type: json['type'] as String?, token: json['token'] as String?);

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{'type': instance.type, 'token': instance.token};
