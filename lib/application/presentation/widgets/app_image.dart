import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    this.url,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
    this.placeHolder,
  });

  final String? url;
  final double width;
  final double height;
  final BoxFit fit;
  final Widget? placeHolder;

  @override
  Widget build(BuildContext context) {
    if ((url ?? '').isEmpty) return placeHolder ?? const SizedBox();
    return CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 60),
      fadeOutDuration: const Duration(milliseconds: 60),
      width: width,
      height: height,
      fit: fit,
      imageUrl: url ?? '',
      // errorWidget:
      //     (placeHolder == null) ? null : (context, url, error) => placeHolder!,
      // placeholder:
      //     (placeHolder == null) ? null : (context, url) => placeHolder!,
    );
  }
}
