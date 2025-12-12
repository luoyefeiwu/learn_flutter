import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hook_up/pages/home/tab_search/filter_bar/data.dart';
import 'package:hook_up/pages/home/tab_search/filter_bar/item.dart';
import 'package:hook_up/provider/room_filter.dart';
import 'package:hook_up/utils/common_picker/index.dart';
import 'package:provider/provider.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult> onChange;

  const FilterBar({super.key, required this.onChange});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool isAreaActive = false;
  bool isRentTypeActive = false;
  bool isPriceActive = false;
  bool isFilterActive = false;

  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];

  _onAreaChange(context) {
    setState(() {
      isAreaActive = true;
    });
    var result = CommonPicker.showPicker(
      context: context,
      options: areaList.map((item) => item.name).toList(),
      vales: 0,
    );
    result
        .then((index) {
          if (index == null) return;
          setState(() {
            areaId = areaList[index].id;
          });
        })
        .whenComplete(() {
          setState(() {
            isAreaActive = false;
          });
        });

    _onChange();
  }

  _onRentTypeChange(context) {
    setState(() {
      isRentTypeActive = true;
    });
    var result = CommonPicker.showPicker(
      context: context,
      options: roomTypeList.map((item) => item.name).toList(),
      vales: 0,
    );
    result
        .then((index) {
          if (index == null) return;
          setState(() {
            rentTypeId = roomTypeList[index].id;
          });
        })
        .whenComplete(() {
          setState(() {
            isRentTypeActive = false;
          });
        });

    _onChange();
  }

  _onPriceChange(context) {
    setState(() {
      isPriceActive = true;
    });
    var result = CommonPicker.showPicker(
      context: context,
      options: priceList.map((item) => item.name).toList(),
      vales: 0,
    );
    result
        .then((index) {
          if (index == null) return;
          setState(() {
            priceId = priceList[index].id;
          });
        })
        .whenComplete(() {
          setState(() {
            isPriceActive = false;
          });
        });

    _onChange();
  }

  _onFilterChange(context) {
    Scaffold.of(context).openEndDrawer();
  }

  _onChange() {
    var selectedList = context.watch<FilterBarModel>().selectedList;

    if (widget.onChange != null) {
      widget.onChange(
        FilterBarResult(
          areaId: areaId,
          rentTypeId: rentTypeId,
          priceId: priceId,
          moreIds: selectedList.toList(),
        ),
      );
    }
  }

  //获取数据
  _getData() {
    Map<String, List<GeneralType>> dataList = {
      'roomType': roomTypeList,
      'oriented': orientedList,
      'floor': floorList,
    };
    context.read<FilterBarModel>().dataList = dataList;
  }

  @override
  void initState() {
    Timer.run(() {
      _getData();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _onChange();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.0,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 1.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Item(title: '区域', isActive: isAreaActive, onTap: _onAreaChange),
          Item(
            title: '方式',
            isActive: isRentTypeActive,
            onTap: _onRentTypeChange,
          ),
          Item(title: '资金', isActive: isPriceActive, onTap: _onPriceChange),
          Item(title: '筛选', isActive: isFilterActive, onTap: _onFilterChange),
        ],
      ),
    );
  }
}
