import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wms/models/common/UploadRespon.dart';

import '../../service/common_service.dart';

// const List<String> defaultImages = [
//   'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg',
//   'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg',
//   'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg'
// ];

var imageWidth = 750.0;

var imageHeight = 424.0;

var imageWidthHeightRatio = imageWidth / imageHeight;

//图片
class CommonImagePicker extends StatefulWidget {
  final ValueChanged<List<Map<File, UploadRespon>>> onChange;

  final ImageSource imageSource;

  const CommonImagePicker({
    super.key,
    required this.onChange,
    required this.imageSource,
  });

  @override
  State<CommonImagePicker> createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  CommonService _commonService = CommonService();

  List<File> files = [];

  List<Map<File, UploadRespon>> fileMaps = [];

  _pickImage() async {
    XFile? xfile = await ImagePicker().pickImage(source: widget.imageSource);
    if (xfile != null) {
      var file = File(xfile.path);
      var result = await _commonService.uploadImage(file);
      if (result.isSuccess) {
        setState(() {
          fileMaps = fileMaps..add({file: result.data!});
          files = files..add(file);
        });
      }
      if (widget.onChange != null) {
        widget.onChange(fileMaps);
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
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  files.remove(file);
                  fileMaps.removeWhere((element) => element.containsKey(file));
                });
                if (widget.onChange != null) {
                  widget.onChange(fileMaps);
                }
              },
              child: Container(
                height: 20.0,
                width: 20.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, color: Colors.white, size: 15.0),
              ),
            ),
          ),
        ],
      );
    }

    List<Widget> list = files.map((file) => wrapper(file)).toList()
      ..add(addButton);

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Wrap(spacing: 10.0, runSpacing: 10.0, children: list),
    );
  }
}
