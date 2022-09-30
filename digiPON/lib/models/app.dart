import 'package:flutter/material.dart';

class App extends ChangeNotifier {
  String keyword;

  set setKeyword(String value) {
    keyword = value;
    notifyListeners();
  }

  App(this.keyword);
}
