import 'package:flutter/material.dart';

class ChangeFruit extends ChangeNotifier {
  String? fruit;

  void changeFruit(String newFruit) {
    fruit = newFruit;
    notifyListeners();
  }
}
