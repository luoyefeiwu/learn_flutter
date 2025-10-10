import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/data.dart';
import 'package:hook_up_rent/widget/comment_image.dart';

class ItemWidget extends StatelessWidget {
  final InfoItem data;

  const ItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Row(children: [
        CommentImage(imageUri: data.imageUri),
        Padding(padding: EdgeInsets.only(left: 10.0)),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.title,
              style:
                  const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.resource,
                  style: const TextStyle(fontSize: 10.0),
                ),
                Text(
                  data.time,
                  style: const TextStyle(fontSize: 10.0),
                ),
              ],
            )
          ],
        ))
      ]),
    );
  }
}
