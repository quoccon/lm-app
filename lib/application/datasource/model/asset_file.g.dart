// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppAssetFile _$AppAssetFileFromJson(Map<String, dynamic> json) => AppAssetFile(
  id: (json['id'] as num?)?.toInt(),
  localPath: json['localPath'] as String?,
  name: json['name'] as String?,
  uploadStatus:
      $enumDecodeNullable(_$FileUploadStatusEnumMap, json['uploadStatus']) ??
      FileUploadStatus.normal,
  display_url: json['display_url'] as String?,
  image_url: json['image_url'] as String?,
);

Map<String, dynamic> _$AppAssetFileToJson(AppAssetFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'localPath': instance.localPath,
      'name': instance.name,
      'uploadStatus': _$FileUploadStatusEnumMap[instance.uploadStatus]!,
      'image_url': instance.image_url,
      'display_url': instance.display_url,
    };

const _$FileUploadStatusEnumMap = {
  FileUploadStatus.normal: 'normal',
  FileUploadStatus.loading: 'loading',
  FileUploadStatus.failed: 'failed',
  FileUploadStatus.success: 'success',
};
