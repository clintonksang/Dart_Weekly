import 'package:flutter/material.dart';

class Person with ChangeNotifier {
  String name;
  int age;
  Person(this.name, this.age);

  addAge() {
    age++;
    notifyListeners();
  }

  subtractAge() {
    age--;
    notifyListeners();
  }
}
