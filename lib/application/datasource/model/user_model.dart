import 'package:flutter_cors/flutter_core.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lifemap/application/datasource/model/sport_preferences_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserResponse extends Equatable {
  final TokenModel? token;
  final UserModel? user;

  const UserResponse({this.token, this.user});

  UserResponse copyWith({TokenModel? token, UserModel? user}) {
    return UserResponse(token: token ?? this.token, user: user ?? this.user);
  }

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  @override
  List<Object?> get props => [token, user];
}

@JsonSerializable()
class UserModel extends Equatable {
  final String? username;
  final String? email;
  final String? avatar;
  final String? gender;
  final bool? isVerifyToken;
  @JsonKey(name: 'sport_preferences')
  final List<SportPreferences>? sportPreferences;
  @JsonKey(name: 'created_at_text')
  final String? createAtText;

  const UserModel({
    this.username,
    this.email,
    this.avatar,
    this.gender,
    this.isVerifyToken,
    this.sportPreferences,
    this.createAtText,
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? avatar,
    String? gender,
    bool? isVerifyToken,
    List<SportPreferences>? sportPreferences,
    String? createAtText,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      gender: gender ?? this.gender,
      isVerifyToken: isVerifyToken ?? this.isVerifyToken,
      sportPreferences: sportPreferences ?? this.sportPreferences,
      createAtText: createAtText ?? this.createAtText,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [
    username,
    email,
    avatar,
    gender,
    isVerifyToken,
    sportPreferences,
    createAtText,
  ];
}


@JsonSerializable()
class TokenModel extends Equatable {
  final String? type;
  final String? token;

  const TokenModel({this.type, this.token});

  TokenModel copyWith({String? type, String? token}) {
    return TokenModel(type: type ?? this.type, token: token ?? this.token);
  }

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  @override
  List<Object?> get props => [type, token];
}
