import 'package:flutter/foundation.dart';
import 'package:hook_up/pages/home/tab_search/filter_bar/data.dart';

class FilterBarModel with ChangeNotifier {
  List<GeneralType> _roomTypelist = [];
  List<GeneralType> _orientedList = [];
  List<GeneralType> _floorList = [];

  Set<String> _selectedList = Set<String>();

  Map<String, List<GeneralType>> get dataList {
    return {
      'roomType': _roomTypelist,
      'oriented': _orientedList,
      'floor': _floorList,
    };
  }

  set dataList(Map<String, List<GeneralType>> data) {
    _roomTypelist = data['roomType'] ?? [];
    _orientedList = data['oriented'] ?? [];
    _floorList = data['floor'] ?? [];
    notifyListeners();
  }

  Set<String> get selectedList => _selectedList;

  selectedListToggleItem(String data) {
    if (_selectedList.contains(data)) {
      _selectedList.remove(data);
    } else {
      _selectedList.add(data);
    }
    notifyListeners();
  }
}
