import 'package:flutter_cors/flutter_core.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lifemap/application/datasource/model/user_model.dart';

part 'challenge_model.g.dart';

@JsonSerializable()
class ChallengeResponse extends Equatable {
  @JsonKey(name: 'total_challenges')
  final int? totalChallenges;
  final List<ChallengeModel>? challenges;

  const ChallengeResponse({this.totalChallenges, this.challenges});

  ChallengeResponse copyWith({
    int? totalChallenges,
    List<ChallengeModel>? challenges,
  }) {
    return ChallengeResponse(
      totalChallenges: totalChallenges ?? this.totalChallenges,
      challenges: challenges ?? this.challenges,
    );
  }

  factory ChallengeResponse.fromJson(Map<String, dynamic> json) =>
      _$ChallengeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeResponseToJson(this);

  @override
  List<Object?> get props => [totalChallenges, challenges];
}

@JsonSerializable()
class ChallengeModel extends Equatable {
  final String? id;
  @JsonKey(name: 'challenge_name')
  final String? challengeName;
  @JsonKey(name: 'sport_type')
  final String? sportType;
  final String? goal;
  @JsonKey(name: 'created_by')
  final UserModel? createdBy;
  @JsonKey(name: 'start_date')
  final String? startDate;
  @JsonKey(name: 'end_date')
  final String? endDate;
  @JsonKey(name: 'participants')
  final List<ParticipantsModel>? participants;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  const ChallengeModel({
    this.id,
    this.challengeName,
    this.createdAt,
    this.createdBy,
    this.endDate,
    this.goal,
    this.participants,
    this.sportType,
    this.startDate,
  });

  ChallengeModel copyWith({
    String? id,
    String? challengeName,
    String? sportType,
    String? goal,
    UserModel? createdBy,
    String? startDate,
    String? endDate,
    List<ParticipantsModel>? participants,
    String? createdAt,
  }) {
    return ChallengeModel(
      id: id ?? this.id,
      challengeName: challengeName ?? this.challengeName,
      sportType: sportType ?? this.sportType,
      goal: goal ?? this.goal,
      createdBy: createdBy ?? this.createdBy,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      participants: participants ?? this.participants,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory ChallengeModel.fromJson(Map<String, dynamic> json) =>
      _$ChallengeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeModelToJson(this);

  @override
  List<Object?> get props => [
    id,
    challengeName,
    sportType,
    goal,
    createdBy,
    startDate,
    endDate,
    participants,
    createdAt,
  ];
}

@JsonSerializable()
class ParticipantsModel extends Equatable {
  final UserModel? user;
  final int? progress;
  @JsonKey(name: 'joined_at')
  final String? joinedAt;

  const ParticipantsModel({this.user, this.progress, this.joinedAt});

  ParticipantsModel copyWith({
    UserModel? user,
    int? progress,
    String? joinedAt,
  }) {
    return ParticipantsModel(
      user: user ?? this.user,
      progress: progress ?? this.progress,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }

  factory ParticipantsModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantsModelToJson(this);

  @override
  List<Object?> get props => [user, progress, joinedAt];
}
