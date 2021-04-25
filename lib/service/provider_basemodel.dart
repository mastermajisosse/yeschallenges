import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  setBusy(bool value) {
    _busy = value;
    // print(value);
    notifyListeners();
  }

  bool click = false;
  bool get myclick => click;

  setClick(bool value) {
    click = value;
    // print(value);
    notifyListeners();
  }
}
