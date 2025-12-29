import 'package:flutter/material.dart';

// form  表单实现
class CommonFormItem extends StatelessWidget {
  final String? label;
  final Widget Function(BuildContext context)? contentBuilder;
  final Widget? suffix;
  final String? suffixTetx;
  final String? hinintText;
  final ValueChanged? onChanged;
  final TextEditingController? controller;
  final bool? isRequired;

  const CommonFormItem({
    super.key,
    this.label,
    this.contentBuilder,
    this.suffix,
    this.suffixTetx,
    this.hinintText,
    this.onChanged,
    this.controller,
    this.isRequired,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14.0, right: 14.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 100.0,
            child: Text(
              label ?? '',
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
          ),
          contentBuilder != null
              ? Expanded(child: contentBuilder!(context))
              : Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: hinintText,
                      border: InputBorder.none,
                    ),
                  ),
                ),
          if (suffix != null) suffix!,
          if (suffix == null && suffixTetx != null) Text(suffixTetx!),
        ],
      ),
    );
  }
}
