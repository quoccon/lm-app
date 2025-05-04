import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';

import 'package:json_annotation/json_annotation.dart';

import '../../presentation/widgets/widget.dart';

part 'asset_file.g.dart';

enum FileUploadStatus { normal, loading, failed, success }

@JsonSerializable()
class AppAssetFile extends Equatable {
  final int? id;
  final String? localPath;
  final String? name;
  final FileUploadStatus uploadStatus;
  final String? image_url;
  final String? display_url;

  Widget? get displayView {
    return (localPath.isEmptyOrNull)
        ? AppImage(
      url: display_url,
    )
        : Image.file(
      File(localPath ?? ''),
      fit: BoxFit.cover,
    );
  }

  const AppAssetFile({
    this.id,
    this.localPath,
    this.name,
    this.uploadStatus = FileUploadStatus.normal,
    this.display_url,
    this.image_url,
  });

  AppAssetFile copyWith({
    int? id,
    String? localPath,
    String? name,
    FileUploadStatus? uploadStatus,
    String? image_url,
    String? display_url,
  }) {
    return AppAssetFile(
      id: id ?? this.id,
      localPath: localPath ?? this.localPath,
      image_url: image_url ?? this.image_url,
      name: name ?? this.name,
      uploadStatus: uploadStatus ?? this.uploadStatus,
      display_url: display_url ?? this.display_url,
    );
  }

  factory AppAssetFile.fromJson(Map<String, dynamic> json) =>
      _$AppAssetFileFromJson(json);
  Map<String, dynamic> toJson() => _$AppAssetFileToJson(this);

  @override
  List<Object?> get props => [
    id,
    localPath,
    name,
    uploadStatus,
    display_url,
    image_url,
  ];
}
