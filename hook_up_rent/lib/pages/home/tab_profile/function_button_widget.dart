import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_profile/function_button_data.dart';
import 'package:hook_up_rent/widget/comment_image.dart';

class FunctionButtonWidget extends StatelessWidget {
  final FunctionButtonItem data;

  const FunctionButtonWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        data.onTapHandle!(context);
      },
      child: Container(
        margin: EdgeInsets.only(top: 5.0),
        width: MediaQuery.of(context).size.width * 0.33,
        child: Column(
          children: [CommentImage(imageUri: data.imageUri), Text(data.title)],
        ),
      ),
    );
  }
}
