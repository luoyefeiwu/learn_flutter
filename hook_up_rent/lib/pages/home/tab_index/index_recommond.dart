import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommond_item.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommond_item_widget.dart';

class IndexRecommond extends StatelessWidget {
  const IndexRecommond({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Color(0x08000000)),
        child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '房屋推荐',
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
                Text(
                  '更多',
                  style: TextStyle(color: Colors.black54, fontSize: 10),
                )
              ]),
          const Padding(padding: EdgeInsets.all(5)),
          Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              alignment: WrapAlignment.start,
              children: IndexRecommondItemList.map(
                  (e) => IndexRecommondItemWidget(data: e)).toList())
        ]));
  }
}
