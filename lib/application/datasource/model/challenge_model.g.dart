// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeResponse _$ChallengeResponseFromJson(Map<String, dynamic> json) =>
    ChallengeResponse(
      totalChallenges: (json['total_challenges'] as num?)?.toInt(),
      challenges:
          (json['challenges'] as List<dynamic>?)
              ?.map((e) => ChallengeModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ChallengeResponseToJson(ChallengeResponse instance) =>
    <String, dynamic>{
      'total_challenges': instance.totalChallenges,
      'challenges': instance.challenges,
    };

ChallengeModel _$ChallengeModelFromJson(Map<String, dynamic> json) =>
    ChallengeModel(
      id: json['id'] as String?,
      challengeName: json['challenge_name'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy:
          json['created_by'] == null
              ? null
              : UserModel.fromJson(json['created_by'] as Map<String, dynamic>),
      endDate: json['end_date'] as String?,
      goal: json['goal'] as String?,
      participants:
          (json['participants'] as List<dynamic>?)
              ?.map(
                (e) => ParticipantsModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      sportType: json['sport_type'] as String?,
      startDate: json['start_date'] as String?,
    );

Map<String, dynamic> _$ChallengeModelToJson(ChallengeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'challenge_name': instance.challengeName,
      'sport_type': instance.sportType,
      'goal': instance.goal,
      'created_by': instance.createdBy,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'participants': instance.participants,
      'created_at': instance.createdAt,
    };

ParticipantsModel _$ParticipantsModelFromJson(Map<String, dynamic> json) =>
    ParticipantsModel(
      user:
          json['user'] == null
              ? null
              : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      progress: (json['progress'] as num?)?.toInt(),
      joinedAt: json['joined_at'] as String?,
    );

Map<String, dynamic> _$ParticipantsModelToJson(ParticipantsModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'progress': instance.progress,
      'joined_at': instance.joinedAt,
    };
