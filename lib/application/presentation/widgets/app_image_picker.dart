// import 'package:flutter/material.dart';
// import 'package:flutter_cors/flutter_core.dart';
//
// import '../../../constants/constants.dart';
//
//
// class AppImagePicker {
//   AppImagePicker._();
//   static void show(BuildContext context,
//       {void Function(List<AppAssetFile?>?)? onSelected,
//       int maxItem = 5,
//       bool isMultipleSelect = true}) {
//     UIUtils.showBottomSheet(
//       context,
//       backgroundColor: Colors.white,
//       child: _ImagePickerBody(
//         onSelected: onSelected,
//         isMultipleSelect: isMultipleSelect,
//         maxItem: maxItem,
//       ),
//     );
//   }
// }
//
// class _ImagePickerBody extends StatefulWidget {
//   const _ImagePickerBody({
//     super.key,
//     this.onSelected,
//     this.isMultipleSelect = true,
//     required this.maxItem,
//   });
//
//   final void Function(List<AppAssetFile?>?)? onSelected;
//   final bool isMultipleSelect;
//   final int maxItem;
//
//   @override
//   State<_ImagePickerBody> createState() => _ImagePickerBodyState();
// }
//
// class _ImagePickerBodyState extends State<_ImagePickerBody> {
//   final ImagePickerService _imagePickerService = ImagePickerService.instance;
//
//   @override
//   void initState() {
//     super.initState();
//     _retrieveLostData();
//   }
//
//   Future<void> _retrieveLostData() async {
//     try {
//       await _imagePickerService.retrieveLostData(
//         (XFile? file) {
//           if (file != null) {}
//         },
//         (List<XFile> files) {
//           if (files.isNotEmpty) {}
//         },
//       );
//     } catch (e) {
//       print('Error retrieving lost data: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         borderRadius: AppRadius.radiusTop32,
//         color: BackgroundColor.default1,
//       ),
//       child: SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: IconButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       icon: AppIcon.size24('ic_close.svg',
//                           color: IconColor.secondary)),
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
//               child: Row(
//                 children: [
//                   ImagePickItem(
//                       icon: 'ic_scan.png',
//                       title: 'Chụp ảnh',
//                       onPress: () async {
//                         _imagePickerService
//                             .pickImageFromCamera()
//                             .then((image) async {
//                           if (image == null) {
//                             return;
//                           }
//                           widget.onSelected?.call([
//                             AppAssetFile(
//                                 localPath: image.path, name: image.name)
//                           ]);
//                         });
//                       }),
//                   AppSpaces.space16.horizontal,
//                   ImagePickItem(
//                       icon: 'ic_folder.png',
//                       title: 'Chọn từ thư viện',
//                       onPress: () async {
//                         if (widget.maxItem == 1) {
//                           _imagePickerService
//                               .pickImageFromGallery()
//                               .then((image) async {
//                             if (image == null) {
//                               return;
//                             }
//                             widget.onSelected?.call([
//                               AppAssetFile(
//                                   localPath: image.path, name: image.name)
//                             ]);
//                           });
//                           return;
//                         }
//                         _imagePickerService
//                             .pickMultipleImages(limit: widget.maxItem)
//                             .then((images) async {
//                           if (images.isEmpty) {
//                             return;
//                           }
//                           widget.onSelected?.call(images
//                               .map((e) =>
//                                   AppAssetFile(localPath: e.path, name: e.name))
//                               .toList());
//                         });
//                       }),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
