import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider_one/component/bread_crump.dart';

class BreadCrumbProvider extends ChangeNotifier {
  final List<BreadCrumb> _items = [];
  // UnmodifiableListView this mean that this is only read list and it cannot be modified
  UnmodifiableListView<BreadCrumb> get items => UnmodifiableListView(_items);

  // this will add new item to the list but you can't change the existing one.
  void add(BreadCrumb breadCrumb) {
    for (final item in _items) {
      item.activate();
    }
    _items.add(breadCrumb);
    notifyListeners();
  }

  // the reset function is for clearing of deleting the hole list.
  void reset() {
    _items.clear();
    notifyListeners();
  }
}
