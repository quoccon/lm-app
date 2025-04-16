import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  ImagePickerService._();
  static final ImagePickerService _instance = ImagePickerService._();
  static ImagePickerService get instance => _instance;

  final ImagePicker _picker = ImagePicker();

  static const double MAX_WIDTH = 800;
  static const double MAX_HEIGHt = 800;
  static const int QUALITY = 94;

  Future<XFile?> pickImageFromGallery({
    double maxWidth = MAX_WIDTH,
    double maxHeight = MAX_HEIGHt,
    int? imageQuality = QUALITY,
  }) async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      imageQuality: imageQuality,
    );
    return pickedFile;
  }

  Future<XFile?> pickImageFromCamera({
    double maxWidth = MAX_WIDTH,
    double maxHeight = MAX_HEIGHt,
    int? imageQuality = QUALITY,
  }) async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      imageQuality: imageQuality,
    );
    return pickedFile;
  }

  Future<List<XFile>> pickMultipleImages({
    double maxWidth = MAX_WIDTH,
    double maxHeight = MAX_HEIGHt,
    int? imageQuality = QUALITY,
    int? limit,
  }) async {
    final pickedFiles = await _picker.pickMultiImage(
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      imageQuality: imageQuality,
      limit: limit,
    );
    return pickedFiles;
  }

  Future<void> retrieveLostData(Function(XFile?) onRetrieved,
      Function(List<XFile>) onMultipleRetrieved) async {
    try {
      final LostDataResponse response = await _picker.retrieveLostData();
      if (response.isEmpty) {
        return;
      }
      if (response.file != null) {
        onRetrieved(response.file);
      } else if (response.files != null) {
        onMultipleRetrieved(response.files ?? []);
      }
    } catch (e) {
      print('Error retrieving lost data: $e');
    }
  }

  Future<double> getFileSizeInMB(File file) async {
    final bytes = await file.length();
    final sizeInMB = bytes / (1024 * 1024);
    return sizeInMB;
  }
}
