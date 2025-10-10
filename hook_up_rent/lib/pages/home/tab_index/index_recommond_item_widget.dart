import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommond_item.dart';

var textStyle = const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500);

class IndexRecommondItemWidget extends StatelessWidget {
  final IndexRecommondItem data;

  const IndexRecommondItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(data.navigateUri);
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(5.0),
        width: (MediaQuery.of(context).size.width - 10 * 3) / 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  data.title,
                  style: textStyle,
                ),
                Text(
                  data.subTitle,
                  style: textStyle,
                ),
              ],
            ),
            CachedNetworkImage(
              imageUrl: data.imageUri,
              width: 100,
              height: 80,
              fit: BoxFit.contain,
              placeholder: (context, url) =>
                  const CircularProgressIndicator(), // 加载时的占位符
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error), // 加载失败时的错误指示器
            ),
          ],
        ),
      ),
    );
  }
}
