import 'package:flutter/material.dart';

class CommonTag extends StatelessWidget {
  final String tag;

  const CommonTag({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        tag,
        style: TextStyle(color: tag.length >= 4 ? Colors.red : Colors.blue),
      ),
    );
  }
}
