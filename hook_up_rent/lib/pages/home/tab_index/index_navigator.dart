import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_navigator_item.dart';

class IndexNavigator extends StatelessWidget {
  const IndexNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 1, bottom: 1),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: indexNavigatorItemList
                .map((item) => InkWell(
                      onTap: () {
                        item.onTap(context);
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: 80,
                            height: 35,
                            child: CachedNetworkImage(
                              imageUrl: item.imageUri,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(), // 加载时的占位符
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error), // 加载失败时的错误指示器
                            ),
                          ),
                          Text(item.title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10),)
                        ],
                      ),
                    ))
                .toList()));
  }
}
