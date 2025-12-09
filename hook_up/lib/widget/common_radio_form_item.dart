import 'package:flutter/material.dart';
import 'package:hook_up/widget/common_form_item.dart';

class CommonRadioFormItem extends StatelessWidget {
  final String label;
  final List<String> options;
  final int value;
  final ValueChanged<int> onChange;

  const CommonRadioFormItem(
      {super.key,
      required this.label,
      required this.options,
      required this.value,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contentBuilder: (context) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                options.length,
                (index) => Row(
                      children: [
                        Radio(
                          value: index,
                          groupValue: value,
                          onChanged: (int? newValue) {
                            if (newValue != null) {
                              onChange(newValue);
                            }
                          },
                        ),
                        Text(options![index])
                      ],
                    )));
      },
    );
  }
}
