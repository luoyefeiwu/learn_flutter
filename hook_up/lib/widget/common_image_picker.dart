import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:image_picker/image_picker.dart';

const List<String> defaultImages = [
  'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg',
  'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg',
  'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg'
];

var imageWidth = 750.0;

var imageHeight = 424.0;

var imageWidthHeightRatio = imageWidth / imageHeight;

//图片
class CommonImagePicker extends StatefulWidget {
  final ValueChanged<List<File>> onChange;

  const CommonImagePicker({super.key, required this.onChange});

  @override
  State<CommonImagePicker> createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  List<File> files = [];

  _pickImage() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      setState(() {
        files = files..add(File(xfile.path));
      });
      if (widget.onChange != null) {
        widget.onChange(files);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width - 10.0 * 4) / 3;
    var height = width / imageWidthHeightRatio;

    Widget addButton = GestureDetector(
      onTap: () {
        _pickImage();
      },
      child: Container(
        height: height,
        width: width,
        color: Colors.grey,
        child: Center(
          child: Text(
            '+',
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w100),
          ),
        ),
      ),
    );

    Widget wrapper(File file) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Image.file(file, height: height, width: width, fit: BoxFit.cover),
          Positioned(
              top: -20.0,
              right: -20.0,
              child: IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    files = files..remove(file);
                  });
                  if (null != widget.onChange) {
                    widget.onChange(files);
                  }
                },
              ))
        ],
      );
    }

    // Image.file(
    //   file,
    //   height: height,
    //   width: width,
    //   fit: BoxFit.cover,
    // ),

    List<Widget> list = files.map((file) => wrapper(file)).toList()
      ..add(addButton);

    return Container(
        padding: EdgeInsets.all(10.0),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: list,
        ));
  }
}
