import 'package:flutter/cupertino.dart';

class UIRepository extends ChangeNotifier {
  int _itemSelected = 0;

  int get itemSelected => _itemSelected;

  set itemSelected(int newItemSelected) {
    _itemSelected = newItemSelected;
    notifyListeners();
  }
}
