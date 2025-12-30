import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonPicker {
  static Future<int?> showPicker({
    required BuildContext context,
    required List<String> options,
    int initialIndex = 0, // 修复参数名，改为 initialIndex
    double height = 300,
  }) {
    int selectedIndex = initialIndex; // 使用传入的初始索引

    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: height, // 使用传入的高度参数
          child: Column(
            children: [
              // 标题栏
              Container(
                height: 50.0,
                //padding: const EdgeInsets.symmetric(vertical: 1),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoColors.separator,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: const Text('取消'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    CupertinoButton(
                      child: const Text('确定'),
                      onPressed: () {
                        Navigator.pop(context, selectedIndex);
                      },
                    ),
                  ],
                ),
              ),
              // 滚轮选择器
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40.0,
                  backgroundColor: Colors.white,
                  onSelectedItemChanged: (int index) {
                    selectedIndex = index;
                  },
                  children: options
                      .map((option) => Center(child: Text(option)))
                      .toList(), // 使用传入的 options 参数
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
