import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lifemap/application/presentation/widgets/app_bg_container.dart';
import 'package:lifemap/constants/app_colors.dart';
import 'package:lifemap/constants/app_icons.dart';
import 'package:lifemap/constants/app_spaces.dart';
import 'package:lifemap/constants/app_textstyles.dart';

import '../../../constants/app_radius.dart';
import 'item_pick_item.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(List<File>) onImagesSelected;
  final bool allowMultiple;

  const ImagePickerWidget({
    Key? key,
    required this.onImagesSelected,
    this.allowMultiple = true,
  }) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ValueNotifier<List<File>> _imagesNotifier = ValueNotifier([]);
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImages(ImageSource source) async {
    try {
      if (source == ImageSource.gallery && widget.allowMultiple) {
        final List<XFile> pickedFiles = await _picker.pickMultiImage(
          maxWidth: 800,
          maxHeight: 800,
          imageQuality: 85,
        );
        if (pickedFiles.isNotEmpty) {
          _imagesNotifier.value =
              pickedFiles.map((file) => File(file.path)).toList();
          widget.onImagesSelected(_imagesNotifier.value);
        }
      } else {
        final XFile? pickedFile = await _picker.pickImage(
          source: source,
          maxWidth: 800,
          maxHeight: 800,
          imageQuality: 85,
        );
        if (pickedFile != null) {
          _imagesNotifier.value = [File(pickedFile.path)];
          widget.onImagesSelected(_imagesNotifier.value);
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Lỗi khi chọn ảnh: $e')));
    }
  }

  void _removeImage(File image) {
    _imagesNotifier.value = List.from(_imagesNotifier.value)..remove(image);
    widget.onImagesSelected(_imagesNotifier.value);
  }

  void _showOptionPickImage() {
    UIUtils.showBottomSheet(
      context,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: AppRadius.radiusTop32,
          color: BackgroundColor.default1,
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: AppIcon.size24(
                        'ic_close.svg',
                        color: IconColor.secondary,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImagePickItem(
                      icon: 'ic_camera.svg',
                      title: 'Chọn ảnh từ thư viện',
                      onPress: () {
                        _pickImages(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                    ),
                    AppSpaces.space12.horizontal,
                    ImagePickItem(
                      icon: 'ic_camera.svg',
                      title: 'Chụp ảnh',
                      onPress: () {
                        _pickImages(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _imagesNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<File>>(
      valueListenable: _imagesNotifier,
      builder: (context, images, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            images.isNotEmpty
                ? Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      images.map((image) {
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                image,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: -5,
                              right: -5,
                              child: GestureDetector(
                                onTap: () => _removeImage(image),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: BackgroundColor.default1,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: const EdgeInsets.all(2),
                                  child: const Icon(
                                    Icons.close,
                                    size: 20,
                                    color: Colors.black,
                                  ), // Thay AppIcon.size20('ic_close.svg') bằng Icon mặc định
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                )
                : InkWell(
                  onTap: () => _showOptionPickImage(),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.image, size: 50, color: Colors.grey[400]),
                  ),
                ),
          ],
        );
      },
    );
  }
}
