import 'package:flutter/material.dart';
import 'package:hook_up/widget/comment_image.dart';

class Advertisement extends StatelessWidget {
  const Advertisement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0,bottom: 20.0,left: 10.0,right: 10.0),
        height: 100.0,
        child: Image(
          image: NetworkImage(
              'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg'),
          fit: BoxFit.fill,
        ));
  }
}
