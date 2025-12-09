import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommentImage extends StatelessWidget {
  final String imageUri;

  final double width;

  final double height;

  const CommentImage(
      {super.key,
      required this.imageUri,
      this.width = 100.0,
      this.height = 100.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: CachedNetworkImage(
          imageUrl: imageUri,
          placeholder: (context, url) =>
              const CircularProgressIndicator(), // 加载时的占位符
          errorWidget: (context, url, error) =>
              const Icon(Icons.error), // 加载失败时的错误指示器
        ));
  }
}
