import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonPicker {
  static Future<int?> showPicker({
    required BuildContext context,
    required List<String> options,
    required int vales,
    double height = 300,
  }) {
    var buttonTextStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w600,
    );
    var controller = FixedExtentScrollController(initialItem: vales);

    return showCupertinoModalPopup<int>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.grey,
          height: height,
          child: Column(
            children: [
              Container(
                height: 40.0,
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('取消', style: buttonTextStyle),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(controller.selectedItem);
                      },
                      child: Text('确认', style: buttonTextStyle),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  scrollController: controller,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  itemExtent: 32.0,
                  onSelectedItemChanged: (val) {},
                  children: options.map((item) => Text(item)).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
